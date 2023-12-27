//
//  UIImage+Extensions.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 25.12.2023.
//

import UIKit
extension UIImageView {
    func setImage(url: URL, placeholder: UIImage?) {
        self.image = placeholder

        Task { [weak self] in
            let (data, _) = try await URLSession.shared.data(from: url)
            self?.image = UIImage(data: data)
        }
    }
    func setImage(url: URL, completion: @escaping (Bool) -> Void) {
        Task { [weak self] in
            let (data, _) = try await URLSession.shared.data(from: url)
            self?.image = UIImage(data: data)
            completion(true)
        }
    }
}
