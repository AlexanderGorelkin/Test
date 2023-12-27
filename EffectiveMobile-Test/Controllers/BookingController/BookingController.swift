//
//  BookingController.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit


final class BookingController: UIViewController {
    
    private let bookingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = .init(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.backgroundColor = R.Colors.Default.background
        return scrollView
    }()
    private lazy var ratingView: RatingView? = nil
    private lazy var bookingInfoView: BookingInfoView? = nil
    private lazy var fullPriceView: FullPriceView? = nil
    private lazy var buyerInfo = BuyerInfoView()
    private lazy var mainButton: MainButtonContainer? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Colors.Default.background
        NetworkManager.shared.fetchBooking { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.ratingView = RatingView(rating: model.horating, ratingName: model.ratingName, name: model.hotelName, adress: model.hotelAdress)
                self.bookingInfoView = BookingInfoView(departure: model.departure, arrivalCountry: model.arrivalCountry, tourDateStart: model.tourDateStart, tourDateStop: model.tourDateStop, numberOfNights: model.numberOfNights, hotelName: model.hotelName, room: model.room, nutrition: model.nutrition)
                self.fullPriceView = FullPriceView(tourPrice: model.tourPrice, fuelCharge: model.fuelCharge, serviceCharge: model.serviceCharge)
                self.mainButton = MainButtonContainer(title: "Оплатить \(model.tourPrice + model.fuelCharge + model.serviceCharge)", action: UIAction(handler: { [weak self] _ in
                    self?.navigationController?.pushViewController(PaidController(), animated: true)
                }))
                setup()
            case .failure(let failure):
                let alertController = UIAlertController(title: "Error", message: "\(failure.localizedDescription)", preferredStyle: .actionSheet)
                self.present(alertController, animated: true)
            }
        }
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
        view.addView(bookingScrollView)
        
        NSLayoutConstraint.activate([
            bookingScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookingScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bookingScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bookingScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ratingView.topAnchor.constraint(equalTo: bookingScrollView.topAnchor),
            ratingView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            bookingInfoView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
            bookingInfoView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            buyerInfo.topAnchor.constraint(equalTo: bookingInfoView.bottomAnchor, constant: 10),
            buyerInfo.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            fullPriceView.topAnchor.constraint(equalTo: buyerInfo.bottomAnchor, constant: 10),
            fullPriceView.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            
            mainButton.topAnchor.constraint(equalTo: fullPriceView.bottomAnchor, constant: 10),
            mainButton.widthAnchor.constraint(equalTo: bookingScrollView.widthAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bookingScrollView.bottomAnchor)
            
        ])
    }
    
    
    
    
    
    
}
