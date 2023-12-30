//
//  HotelViewController.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit


final class HotelController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    private let hotelScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = R.Colors.Default.background
        scrollView.contentSize = .init(width: UIScreen.main.bounds.width, height: 1100)
        return scrollView
    }()
    
    private lazy var hotelView: HotelView? = nil
    private lazy var aboutHotelView: AboutHotelView? = nil
    private lazy var bottomButton: MainButtonContainer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Отель"
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        networkManager.fetchHotel { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let hotelModel):
                self.hotelView = HotelView(hotelModel: hotelModel)
                self.aboutHotelView = AboutHotelView(hotelModel: hotelModel)
                self.bottomButton = MainButtonContainer(title: "К выбору номера", action: UIAction(handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.navigationController?.pushViewController(NumberInfoController(), animated: true)
                }))
                setup()
            case .failure(let error):
                let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .actionSheet)
                present(alert, animated: true)
            }
            
        }
    }
    func setup() {
        guard let hotelView = hotelView,
              let aboutHotelView = aboutHotelView,
              let bottomButton = bottomButton
        else { return }
        hotelScrollView.addView(hotelView)
        hotelScrollView.addView(aboutHotelView)
        hotelScrollView.addView(bottomButton)
        view.addView(hotelScrollView)
        NSLayoutConstraint.activate([
            hotelScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hotelScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hotelScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            hotelScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            hotelView.topAnchor.constraint(equalTo: hotelScrollView.topAnchor, constant: -10),
            hotelView.widthAnchor.constraint(equalTo: hotelScrollView.widthAnchor),
            
            aboutHotelView.topAnchor.constraint(equalTo: hotelView.bottomAnchor, constant: 10),
            aboutHotelView.widthAnchor.constraint(equalTo: hotelScrollView.widthAnchor),
            
            bottomButton.topAnchor.constraint(equalTo: aboutHotelView.bottomAnchor, constant: 10),
            bottomButton.widthAnchor.constraint(equalTo: hotelScrollView.widthAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: hotelScrollView.bottomAnchor)
            
        ])
    }
    
}
