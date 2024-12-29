//
//  AuthButtonTextModifier.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import Foundation
import SwiftUI

struct AuthButtonTextModifier: ViewModifier {
    // MARK: - Constant
    let trailingPading = 20.0
    let cornerRadius = 10.0
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(.all)
            .frame(maxWidth: .infinity)
            .background(Color.theme.primaryColor)
            .cornerRadius(cornerRadius)
            .foregroundColor(Color.theme.textColor)
            .padding(.all, trailingPading)
    }
}
