//
//  HotelView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit


final class HotelView: UIView {
    
    private lazy var photoCollection: PhotoCarouselView? = nil
    private lazy var ratingView: RatingView? = nil
    private lazy var priceView: PriceView? = nil
    
    
    
    
    
    init(hotelModel: HotelModel) {
        super.init(frame: .zero)
        photoCollection = PhotoCarouselView(imageUrls: hotelModel.imageUrls)
        ratingView = RatingView(rating: hotelModel.rating, ratingName: hotelModel.ratingName, name: hotelModel.name, adress: hotelModel.adress)
        priceView = PriceView(pre: "от ", minPrice: hotelModel.minimalPrice, priceForIt: hotelModel.priceForIt)
        setup()
        
    }
    func setup() {
        guard let photoCollection = photoCollection,
              let ratingView = ratingView,
              let priceView = priceView else { return }
        layer.cornerRadius = 10
        backgroundColor = .white
        
        addView(photoCollection)
        addView(ratingView)
        addView(priceView)
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoCollection.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            photoCollection.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            photoCollection.heightAnchor.constraint(equalTo: photoCollection.widthAnchor, multiplier: 0.75),
            
            ratingView.topAnchor.constraint(equalTo: photoCollection.bottomAnchor, constant: 16),
            ratingView.leftAnchor.constraint(equalTo: leftAnchor),
            ratingView.rightAnchor.constraint(equalTo: rightAnchor),
            
            priceView.topAnchor.constraint(equalTo: ratingView.bottomAnchor),
            priceView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            priceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
