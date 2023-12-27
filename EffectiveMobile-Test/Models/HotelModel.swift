//
//  HotelModel.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 24.12.2023.
//

import Foundation
import Foundation

// MARK: - Welcome
struct HotelModel: Codable {
    let id: Int
    let name, adress: String
    let minimalPrice: Double
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [URL]
    let aboutTheHotel: AboutTheHotel

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}
