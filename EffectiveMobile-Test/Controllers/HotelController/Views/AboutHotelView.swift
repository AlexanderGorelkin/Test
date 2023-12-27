//
//  AboutHotelView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 24.12.2023.
//

import UIKit

final class AboutHotelView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private lazy var peculiaritiesView: PeculiaritiesView? = nil
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
   
    private lazy var stackOfNonActiveView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(NonActiveView(model: .init(leftLogo: UIImage(systemName: "square.text.square")!, topLabel: "Удобства", bottomLabel: "Самое необходимое")))
        stackView.addArrangedSubview(NonActiveView(model: .init(leftLogo: UIImage(systemName: "checkmark.square")!, topLabel: "Что включено", bottomLabel: "Самое необходимое")))
        stackView.addArrangedSubview(NonActiveView(model: . init(leftLogo: UIImage(systemName: "xmark.square")!, topLabel: "Что не включено", bottomLabel: "Самое необходимое")))
        stackView.backgroundColor = R.Colors.NonActiveColor.backgroundColor
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    
    
    init(hotelModel: HotelModel) {
        super.init(frame: .zero)
        
        peculiaritiesView = PeculiaritiesView(peculiaritiesArray: hotelModel.aboutTheHotel.peculiarities)
        descriptionLabel.text = hotelModel.aboutTheHotel.description
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        guard let peculiaritiesView = peculiaritiesView else { return }
        backgroundColor = .white
        layer.cornerRadius = 15
        addView(titleLabel)
       addView(peculiaritiesView)
        addView(descriptionLabel)
        addView(stackOfNonActiveView)
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            
            peculiaritiesView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            peculiaritiesView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            peculiaritiesView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            peculiaritiesView.heightAnchor.constraint(equalToConstant: 100),
           
            
            descriptionLabel.topAnchor.constraint(equalTo: peculiaritiesView.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            stackOfNonActiveView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            stackOfNonActiveView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackOfNonActiveView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stackOfNonActiveView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
            
        ])
    }
    
    
}
