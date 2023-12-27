//
//  PaidController.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit


final class PaidController: UIViewController {
    
    
    private lazy var imageView = {
        
        let label = UILabel()
        label.text = "🎉"
        label.font = .systemFont(ofSize: 50)
        let imageView = UIImageView()
        imageView.backgroundColor = R.Colors.Default.background
        imageView.widthAnchor.constraint(equalToConstant: 94).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 94).isActive = true
        imageView.addView(label)
        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        imageView.layer.cornerRadius = 47
        return imageView
    }()
    
    
    private lazy var centerLabel = {
       let label = UILabel()
        label.text = "Ваш заказ принят в работу"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var bottomLabel = {
       let label = UILabel()
        label.text = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    private lazy var mainButton = MainButtonContainer(title: "Супер!", action: UIAction(handler: { [weak self] _ in
        self?.navigationController?.popToRootViewController(animated: true)
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Заказ оплачен"
        view.addView(centerLabel)
        view.addView(imageView)
        view.addView(bottomLabel)
        view.addView(mainButton)
        
        NSLayoutConstraint.activate([
        
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: centerLabel.topAnchor, constant: -10),
           
            
            bottomLabel.topAnchor.constraint(equalTo: centerLabel.bottomAnchor, constant: 10),
            bottomLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bottomLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            mainButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        
        
        ])
    }
    
    
    
}
