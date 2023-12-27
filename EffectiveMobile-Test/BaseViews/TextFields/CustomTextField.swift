//
//  CustomTextField.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit


public class CustomTextField: UITextField {
    
    
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = R.Colors.Default.background
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    
    func startEditing() {
        guard let placeholderText = placeholder else { return }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 5, 10)
    }
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 5, 10);
    }
}
