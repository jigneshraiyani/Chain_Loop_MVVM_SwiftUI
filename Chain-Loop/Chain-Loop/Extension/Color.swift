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
