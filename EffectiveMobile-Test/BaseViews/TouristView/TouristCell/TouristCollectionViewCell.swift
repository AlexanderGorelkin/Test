//
//  TouristCollectionViewCell.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 28.12.2023.
//

import UIKit


final class TouristCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TouristCollectionViewCell.self)

    private lazy var touristTextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 16, weight: .bold)
        textField.backgroundColor = R.Colors.Default.background
        textField.delegate = self
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        addView(touristTextField)
        NSLayoutConstraint.activate([
            touristTextField.topAnchor.constraint(equalTo: topAnchor),
            touristTextField.leftAnchor.constraint(equalTo: leftAnchor),
            touristTextField.rightAnchor.constraint(equalTo: rightAnchor),
            touristTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func configure(placeholderText: String) {
        touristTextField.placeholder = placeholderText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TouristCollectionViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.isEmpty {
            textField.backgroundColor = R.Colors.Default.error
        } else {
            textField.backgroundColor = R.Colors.Default.background
        }
    }
}
