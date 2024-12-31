//
//  PrimaryButtonTextModifier.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/30/24.
//

import Foundation
import SwiftUI

struct PrimaryButtonTextModifier: ViewModifier {
    // MARK: - Constant
    let continueButtonHPadding = 50.0
    let continueButtonVPadding = 15.0
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.theme.accentColor)
            .padding(.horizontal, continueButtonHPadding)
            .padding(.vertical, continueButtonVPadding)
            .fontWeight(.heavy)
            .background(
                Capsule().strokeBorder(Color.theme.accentColor, lineWidth: 1.25)
              )
    }
}
