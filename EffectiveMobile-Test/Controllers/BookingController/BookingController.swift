//
//  BookingController.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit


final class BookingController: UIViewController, AddNewTouristDelegate {
    
    private let toursitArray: [String] = ["Первый турист", "Второй турист", "Третий турист", "Четвертый турист", "Пятый турист", ]
    
    private let bookingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = .init(width: UIScreen.main.bounds.width, height: 2000)
        scrollView.backgroundColor = R.Colors.Default.background
        return scrollView
    }()
    private lazy var ratingView: RatingView? = nil
    private lazy var bookingInfoView: BookingInfoView? = nil
    private lazy var fullPriceView: FullPriceView? = nil
    private lazy var buyerInfo = BuyerInfoView()
    private lazy var mainButton: MainButtonContainer? = nil
    
    
    
    // MARK:  TOURIST
    private var touristStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var addTouristButton = ToursitButton(type: .plusButton)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Бронирование"
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        addTouristButton.addDelegate = self
        touristStackView.addArrangedSubview(TouristView(numberOfTourist: toursitArray[0]))
        NetworkManager.shared.fetchBooking { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.ratingView = RatingView(rating: model.horating, ratingName: model.ratingName, name: model.hotelName, adress: model.hotelAdress)
                self.bookingInfoView = BookingInfoView(departure: model.departure, arrivalCountry: model.arrivalCountry, tourDateStart: model.tourDateStart, tourDateStop: model.tourDateStop, numberOfNights: model.numberOfNights, hotelName: model.hotelName, room: model.room, nutrition: model.nutrition)
                self.fullPriceView = FullPriceView(tourPrice: model.tourPrice, fuelCharge: model.fuelCharge, serviceCharge: model.serviceCharge)
                self.mainButton = MainButtonContainer(title: "Оплатить \(Double(model.tourPrice + model.fuelCharge + model.serviceCharge).formatted())₽", action: UIAction(handler: { _ in
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.moveOrNot()
                    }
                }))
                setup()
            case .failure(let failure):
                let alertController = UIAlertController(title: "Error", message: "\(failure.localizedDescription)", preferredStyle: .actionSheet)
                self.present(alertController, animated: true)
            }
        }
    }
    
    func addNewTourist() {
        if touristStackView.subviews.count < toursitArray.count {
            touristStackView.addArrangedSubview(TouristView(numberOfTourist: toursitArray[touristStackView.subviews.count]))
        }
        
    }
    private func moveOrNot() -> Void {
        
        let array = getAllTextFields(fromView : self.view)
        for textField in array {
            if textField.backgroundColor == R.Colors.Default.error {
                return
            }
        }
        
        navigationController?.pushViewController(PaidController(), animated: true)

    }
    func getAllTextFields(fromView view: UIView)-> [UITextField] {
        return view.subviews.flatMap { (view) -> [UITextField] in
            if view is UITextField {
                let textField = view as! UITextField
                guard let text = textField.text else { return [(view as! UITextField)] }
                if text.isEmpty || textField.backgroundColor == R.Colors.Default.error {
                    textField.backgroundColor = R.Colors.Default.error
                }
                return [(view as! UITextField)]
            } else {
                return getAllTextFields(fromView: view)
            }
        }.compactMap({$0})
    }
    
    
    
    func setup() {
        guard let ratingView = ratingView,
              let fullPriceView = fullPriceView,
              let bookingInfoView = bookingInfoView,
              let mainButton = mainButton else { return }
        bookingScrollView.addView(ratingView)
        bookingScrollView.addView(bookingInfoView)
        bookingScrollView.addView(buyerInfo)
        bookingScrollView.addView(fullPriceView)
        bookingScrollView.addView(mainButton)
        bookingScrollView.addView(addTouristButton)
        bookingScrollView.addView(touristStackView)
        view.addView(bookingScrollView)
        
        NSLayoutConstraint.activate([
            bookingScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookingScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bookingScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bookingScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            ratingView.topAnchor.constraint(equalTo: bookingScrollView.topAnchor),
            ratingView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            bookingInfoView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
            bookingInfoView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            buyerInfo.topAnchor.constraint(equalTo: bookingInfoView.bottomAnchor, constant: 10),
            buyerInfo.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            touristStackView.topAnchor.constraint(equalTo: buyerInfo.bottomAnchor, constant: 10),
            touristStackView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            addTouristButton.topAnchor.constraint(equalTo: touristStackView.bottomAnchor, constant: 10),
            addTouristButton.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            fullPriceView.topAnchor.constraint(equalTo: addTouristButton.bottomAnchor, constant: 10),
            fullPriceView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            mainButton.topAnchor.constraint(equalTo: fullPriceView.bottomAnchor, constant: 10),
            mainButton.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bookingScrollView.bottomAnchor)
            
        ])
    }
    
    
    
    
    
    
}
