//
//  TourInfoView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit

class PointView: UIView {
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    private lazy var textStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
        return stackView
    }()
    init(leftLabelText: String, rightLabelText: String) {
        super.init(frame: .zero)
        self.leftLabel.text = leftLabelText
        self.rightLabel.text = rightLabelText
        addView(textStackView)
        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: topAnchor),
            textStackView.leftAnchor.constraint(equalTo: leftAnchor),
            textStackView.rightAnchor.constraint(equalTo: rightAnchor),
            textStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


final class FullPriceView: UIView {
    
    private lazy var tourStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    init(tourPrice: Int, fuelCharge: Int, serviceCharge: Int) {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        backgroundColor = .white
        let tourPriceView = PointView(leftLabelText: "Тур", rightLabelText: "\(tourPrice)")
        let fuelChargeView = PointView(leftLabelText: "Топливный сбо", rightLabelText: "\(fuelCharge)")
        let serviceChargeView = PointView(leftLabelText: "Сервисный сбор", rightLabelText: "\(serviceCharge)")
        let fullPrice = PointView(leftLabelText: "К оплате", rightLabelText: "\(tourPrice + fuelCharge + serviceCharge)")
        tourStackView.addArrangedSubview(tourPriceView)
        tourStackView.addArrangedSubview(fuelChargeView)
        tourStackView.addArrangedSubview(serviceChargeView)
        tourStackView.addArrangedSubview(fullPrice)
        addView(tourStackView)
        NSLayoutConstraint.activate([
            tourStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            tourStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            tourStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            tourStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

