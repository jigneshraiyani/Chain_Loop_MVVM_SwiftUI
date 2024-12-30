//
//  TextFieldModifier.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    // MARK: - Constant
    let fontPadding = 16.0
    let horizontalPadding = 20.0
    let cornerRadius = 14.0
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.all, fontPadding)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(cornerRadius)
            .padding(.horizontal, horizontalPadding)
    }
    
}
