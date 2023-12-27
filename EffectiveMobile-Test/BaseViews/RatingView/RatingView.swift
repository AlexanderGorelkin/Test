//
//  RatingView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit


final class RatingView: UIView {
    private lazy var starRatingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor =  R.Colors.RatingColors.textColor
        return imageView
    }()
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Превосходно"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = R.Colors.RatingColors.textColor
        return label
    }()
    private lazy var starStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 11, bottom: 5, right: 11)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(starRatingImage)
        stackView.addArrangedSubview(ratingLabel)
        stackView.backgroundColor = R.Colors.RatingColors.starBackground
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var hotelNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 2
        label.text = "Steigenberger Makadi"
        label.textColor = .black
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        label.textColor = .blue
        return label
    }()
    private lazy var ratingStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.addArrangedSubview(starStack)
        stackView.addArrangedSubview(hotelNameLabel)
        stackView.addArrangedSubview(locationLabel)
        return stackView
    }()
    
    init(rating: Int, ratingName: String ,name: String, adress: String) {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 10
        self.ratingLabel.text = "\(rating) \(ratingName)"
        self.hotelNameLabel.text = name
        self.locationLabel.text = adress
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
       setup()
    }
    func setup() {
        addView(ratingStackView)
        NSLayoutConstraint.activate([
            ratingStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ratingStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            ratingStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            ratingStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
