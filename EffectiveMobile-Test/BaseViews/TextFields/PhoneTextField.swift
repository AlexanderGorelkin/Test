//
//  CustomTextField.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit


enum TextFieldType {
    case mail
    case phone
    case another
    
    func textField() -> UITextField {
        switch self {
        case .mail:
            return PhoneTextField()
        case .phone:
            return PhoneTextField()
        case .another:
            return PhoneTextField()
        }
    }
}

final class PhoneTextField: UITextField {
    let defaultColor = R.Colors.Default.background
    var status: Bool = false
    
    init() {
        super.init(frame: .zero)
        backgroundColor = defaultColor
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        delegate = self
        keyboardType = .phonePad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension PhoneTextField: UITextFieldDelegate {
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "*" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text == "" {
            textField.text = "+7 (***) ***-**-**"
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+* (***) ***-**-**", phone: newString)
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.replacingOccurrences(of: "*", with: "").count < 18 {
            backgroundColor = R.Colors.Default.error
        } else {
            status = true
            backgroundColor = defaultColor
        }
    }
    
}

