//
//  UIScrollView+Extensions.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit


extension UIScrollView {

    func resizeScrollViewContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize.height = contentRect.size.height
    }
}
