//
//  MainButton.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit


final class MainButton: UIButton {
    
    
    
    init(title: String, action: UIAction?) {
        super.init(frame: .zero)
        print("Action added to button")
        
        var conf = UIButton.Configuration.filled()
        conf.cornerStyle = .large
        conf.contentInsets = .init(top: 14, leading: 0, bottom: 14, trailing: 0)
        configuration = conf
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 15
        guard let action = action else { return }
        addAction(action, for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

