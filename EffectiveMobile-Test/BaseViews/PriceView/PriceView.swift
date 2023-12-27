//
//  PriceView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit

final class PriceView: UIView {
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "от 134 673 ₽"
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        label.minimumScaleFactor = 0.8
        return label
    }()
    private lazy var optionsLabel: UILabel = {
        let label = UILabel()
        label.text = "за тур с перелётом"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray
        return label
    }()
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .bottom
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(optionsLabel)
        return stackView
    }()
    
    init(pre: String, minPrice: Double, priceForIt: String) {
        super.init(frame: .zero)
        setupPriceView()
        priceLabel.text = "\(pre)\(minPrice.formatted())₽"
        optionsLabel.text = priceForIt.lowercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupPriceView() {
        addView(priceStackView)
        NSLayoutConstraint.activate([
            priceStackView.topAnchor.constraint(equalTo: topAnchor),
            priceStackView.leftAnchor.constraint(equalTo: leftAnchor),
            priceStackView.rightAnchor.constraint(equalTo: rightAnchor),
            priceStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
