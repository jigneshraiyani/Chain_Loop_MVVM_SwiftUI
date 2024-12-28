//
//  Color.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import Foundation
import SwiftUI

extension Color {
   static let theme = Theme()
}
struct Constant {
    struct Color {
        static let accentColor = "AccentColor"
        static let backgroundColor = "BackgroundColor"
        static let primaryColor = "PrimaryColor"
        static let secondaryBackgroundColor = "SecondaryBackgroundColor"
        static let subtextColor = "SubtextColor"
        static let textColor = "TextColor"
    }
    
    struct onBoardColor {
        static let twilightColor = "TwilightColor"
        static let forestColor = "ForestColor"
        static let purpleColor = "PurpleColor"
        static let skyBlueColor = "SkyBlueColor"
    }
}

struct Theme {
    let accentColor = Color(Constant.Color.accentColor)
    let backgroundColor = Color(Constant.Color.backgroundColor)
    let primaryColor = Color(Constant.Color.primaryColor)
    let secondaryBackgroundColor = Color(Constant.Color.secondaryBackgroundColor)
    let subtextColor = Color(Constant.Color.subtextColor)
    let textColor = Color(Constant.Color.textColor)
    
    let twilightColor = Color(Constant.onBoardColor.twilightColor)
    let forestColor = Color(Constant.onBoardColor.forestColor)
    let purpleColor = Color(Constant.onBoardColor.purpleColor)
    let skyBlueColor = Color(Constant.onBoardColor.skyBlueColor)
}
