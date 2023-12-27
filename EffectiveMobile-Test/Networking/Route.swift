//
//  Route.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 25.12.2023.
//

import Foundation
enum Route {
    
    static let baseUrl = "https://run.mocky.io/v3"
    
    case fetchHotel
    case fetchNumbers
    case fetchBooking
    
    var description: String {
        switch self {
        case .fetchHotel:
            return "/d144777c-a67f-4e35-867a-cacc3b827473"
        case .fetchNumbers:
            return "/8b532701-709e-4194-a41c-1a903af00195"
        case .fetchBooking:
            return "/63866c74-d593-432c-af8e-f279d1a8d2ff"
        }
    }
}
