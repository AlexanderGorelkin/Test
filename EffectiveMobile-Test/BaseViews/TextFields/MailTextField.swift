//
//  MailTextField.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit


final class MailTextField: UITextField {
    
    let defaultColor = R.Colors.Default.background
    var status: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = defaultColor
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MailTextField: UITextFieldDelegate {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if !isValidEmail(text) {
            backgroundColor = R.Colors.Default.error
        } else {
            status = true
            backgroundColor = defaultColor
        }
    }
}
