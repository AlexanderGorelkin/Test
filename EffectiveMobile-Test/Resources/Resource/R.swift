//
//  R.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit


enum R {
    enum Colors {
        enum Default {
            static let background = UIColor(hexString: "#F6F6F9")
            static let error = UIColor(hexString: "#EB5757").withAlphaComponent(0.15)
            static let subtitleText = UIColor(hexString: "#828796")
            static let fullPrice = UIColor(hexString: "#0D72FF")
        }
        enum RatingView {
            static let textColor = UIColor(hexString: "#FFA800")
            static let starBackground = UIColor(hexString: "#FFC700").withAlphaComponent(0.2)
            static let subtitleLabel = UIColor(hexString: "#0D72FF")
        }
        enum NonActiveColor {
            static let backgroundColor = UIColor(hexString: "#FBFBFC")
            static let topLabelCount = UIColor(hexString: "#2C3035")
            
        }
        enum RoomCellColors {
            static let aboutHotelTextColor = UIColor(hexString: "0D72FF")
            static let aboutHotelBackgroud = aboutHotelTextColor.withAlphaComponent(0.1)
        }
    }
}
