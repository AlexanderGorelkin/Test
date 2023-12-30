//
//  BuyerInfoView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit

enum TypeOfTextField {
    case phone
    case mail
}

final class BuyerInfoView: UIView {
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Информация о покупателе"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private lazy var phoneTextField = {
        let textField = PhoneTextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Номер телефона"
        return textField
    }()
    private lazy var mailTextField = {
        let textField = MailTextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Почта"
        return textField
    }()
    
    private lazy var miniInfoLabel = {
        let label = UILabel()
         label.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
         label.font = .systemFont(ofSize: 14, weight: .medium)
         label.textColor = .black
         label.textAlignment = .left
        label.numberOfLines = 0
         return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 12
        addView(infoLabel)
        addView(phoneTextField)
        addView(mailTextField)
        addView(miniInfoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            phoneTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            phoneTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            phoneTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
    
            
            
            mailTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            mailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            mailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
           
            
            miniInfoLabel.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 16),
            miniInfoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            miniInfoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            miniInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
