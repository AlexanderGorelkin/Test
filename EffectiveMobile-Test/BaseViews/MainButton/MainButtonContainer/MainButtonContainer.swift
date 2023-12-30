//
//  MainButtonContainer.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit


final class MainButtonContainer: UIView {
    
    
    
    init(title: String, action: UIAction) {
        let mainButtom = MainButton(title: title, action: action)
        super.init(frame: .zero)
        backgroundColor = .white
        addView(mainButtom)
        mainButtom.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        mainButtom.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        mainButtom.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        mainButtom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
