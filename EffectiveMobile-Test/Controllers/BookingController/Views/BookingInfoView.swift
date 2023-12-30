//
//  BookingInfo.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 27.12.2023.
//

import UIKit

final class BookingInfoStackView: UIView {
    
    private lazy var leftLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .blue
        label.textAlignment = .left
        return label
    }()
    private lazy var rightLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private lazy var labelsStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
        return stackView
    }()
    init(leftLabelText: String, rightLabelText: String) {
        super.init(frame: .zero)
        leftLabel.text = leftLabelText
        rightLabel.text = rightLabelText
        addView(labelsStackView)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            labelsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


final class BookingInfoView: UIView {
    
    
    
    private lazy var infoStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    
    init(departure: String, arrivalCountry: String, tourDateStart: String, tourDateStop: String, numberOfNights: Int, hotelName: String, room: String, nutrition: String) {
        super.init(frame: .zero)
        let departureStack = BookingInfoStackView(leftLabelText: "Вылет из", rightLabelText: departure)
        let arrivalCountryStack = BookingInfoStackView(leftLabelText: "Страна, город", rightLabelText: arrivalCountry)
        let tourDateStack = BookingInfoStackView(leftLabelText: "Даты", rightLabelText: tourDateStart + "-" + tourDateStop)
        let numberOfNightsStack = BookingInfoStackView(leftLabelText: "Кол-во ночей", rightLabelText: "\(numberOfNights) ночей")
        let hotelStack = BookingInfoStackView(leftLabelText: "Отель", rightLabelText: hotelName)
        let numberStack = BookingInfoStackView(leftLabelText: "Номер", rightLabelText: room)
        let nutritionStack = BookingInfoStackView(leftLabelText: "Питание", rightLabelText: nutrition)
        
        infoStackView.addArrangedSubview(departureStack)
        infoStackView.addArrangedSubview(arrivalCountryStack)
        infoStackView.addArrangedSubview(tourDateStack)
        infoStackView.addArrangedSubview(numberOfNightsStack)
        infoStackView.addArrangedSubview(hotelStack)
        infoStackView.addArrangedSubview(numberStack)
        infoStackView.addArrangedSubview(nutritionStack)
        
        
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 12
        backgroundColor = .white
        addView(infoStackView)
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            infoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            infoStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            infoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
