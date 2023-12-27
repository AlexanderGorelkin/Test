//
//  RoomsModel.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 24.12.2023.
//

import Foundation

// MARK: - Welcome
struct RoomsModel: Codable {
    let rooms: [Room]
}

// MARK: - Room
struct Room: Codable {
    let id: Int
    let name: String
    let price: Double
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [URL]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
