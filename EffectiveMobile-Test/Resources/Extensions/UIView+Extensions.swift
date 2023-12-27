//
//  UIView+Extensions.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    func addBottomLine() {
        let lineLayer = CALayer()
        lineLayer.backgroundColor = UIColor.cyan.cgColor
        lineLayer.frame = CGRect(x: 0, y: frame.maxY + 3, width: frame.width, height: 10)
        layer.addSublayer(lineLayer)
    }
    
}
