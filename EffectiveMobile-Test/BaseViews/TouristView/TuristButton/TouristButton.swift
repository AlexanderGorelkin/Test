//
//  TouristButton.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 28.12.2023.
//

import UIKit

enum ButtonType {
    case plusButton
    case touristButtom
}
protocol AddNewTouristDelegate: AnyObject {
    func addNewTourist()
}
protocol ShowTouristInfoDelegate: AnyObject {
    func showTouristInfo()
}


final class ToursitButton: UIView {
    
    
    
    private weak var stackView: UIStackView?
    private weak var collectionView: UICollectionView?
    
     weak var addDelegate: AddNewTouristDelegate?
     weak var showDelegate: ShowTouristInfoDelegate?
    
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private lazy var plusButton: UIButton = {
        var conf = UIButton.Configuration.filled()
        let button = UIButton(configuration: conf)
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        return button
    }()
    
    private lazy var touristStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(plusButton)
        return stackView
    }()
    
    
    
    
    /// This is INIT for a UIView that creates a new tourist in the StackView
    /// - Parameter stackView: The StackView to which the new mark will be added
    init(type: ButtonType, numberOfTourist: String = "Первый турист") {
        super.init(frame: .zero)
        layer.cornerRadius = 12
        backgroundColor = .white
        switch type {
        case .plusButton:
            setupForPlus()
        case .touristButtom:
            setupForTourist(numberOfTourist: numberOfTourist)
        }
        
    }
    private func setupForTourist(numberOfTourist: String) {
        textLabel.text = numberOfTourist
        var conf = UIButton.Configuration.tinted()
        
        plusButton.configuration = conf
        plusButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        plusButton.addTarget(self, action: #selector(showTouristInfoAction), for: .touchUpInside)
        constForAdd()
    }
    private func setupForPlus() {
        textLabel.text = "Добавить туриста"
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(addTouristAction), for: .touchUpInside)
        constForPlus()
    }
    
    private func constForPlus() {
        addView(touristStackView)
        NSLayoutConstraint.activate([
            touristStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            touristStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            touristStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            touristStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    private func constForAdd() {
        addView(touristStackView)
        NSLayoutConstraint.activate([
            touristStackView.topAnchor.constraint(equalTo: topAnchor),
            touristStackView.leftAnchor.constraint(equalTo: leftAnchor),
            touristStackView.rightAnchor.constraint(equalTo: rightAnchor),
            touristStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    @objc private func addTouristAction() {
        addDelegate?.addNewTourist()
    }
    
    @objc private func showTouristInfoAction() {
        showDelegate?.showTouristInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
