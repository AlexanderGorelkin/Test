//
//  NumberInfroCollectionViewCell.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit

final class NumberInfroCollectionViewCell: UICollectionViewCell {
    
    weak var navigationController: UINavigationController?
    static let identifier = String(describing: NumberInfroCollectionViewCell.self)
    
    private lazy var photoCollection: PhotoCarouselView? = nil
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Hello number"
        return label
    }()
    private lazy var peculiaritiesView: PeculiaritiesView? = nil
    
    private lazy var aboutNumber = CustomButtom(title: "Подробнее о номере")
    private lazy var priceView: PriceView? = nil
    private lazy var mainButton: MainButton? = nil
    
    func configure(number: Room) {
        photoCollection = PhotoCarouselView(imageUrls: number.imageUrls)
        priceView = PriceView(pre: "", minPrice: number.price, priceForIt: number.pricePer)
        nameLabel.text = number.name
        peculiaritiesView = PeculiaritiesView(peculiaritiesArray: number.peculiarities)
        mainButton = MainButton(title: "Выбрать номер", action: UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(BookingController(), animated: true)
        }))
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.cornerRadius = 12
        backgroundColor = .white
    }
    func setup() {
        guard let photoCollection = photoCollection,
              let priceView = priceView,
              let peculiaritiesView = peculiaritiesView,
        let mainButton = mainButton else { return }
        
        addView(photoCollection)
        addView(nameLabel)
        addView(peculiaritiesView)
        addView(aboutNumber)
        addView(priceView)
        addView(mainButton)
        
        
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoCollection.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            photoCollection.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            photoCollection.heightAnchor.constraint(equalTo: photoCollection.widthAnchor, multiplier: 0.75),
            
            nameLabel.topAnchor.constraint(equalTo: photoCollection.bottomAnchor, constant: 5),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            peculiaritiesView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            peculiaritiesView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            peculiaritiesView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            
            
            aboutNumber.topAnchor.constraint(equalTo: peculiaritiesView.bottomAnchor, constant: 10),
            aboutNumber.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            priceView.topAnchor.constraint(equalTo: aboutNumber.bottomAnchor, constant: 10),
            priceView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            priceView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            mainButton.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 10),
            mainButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            mainButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class CustomButtom: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        // MARK:  SETUP IMAGE FOR DIFFERENT STATES
        setImage(.init(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate), for: .normal)
        layer.cornerCurve = .continuous
        setInsets()
    }
    func setInsets() {
        var config = UIButton.Configuration.filled()
        config.imagePlacement = .trailing
        config.imagePadding = 5
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 8)
        configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
