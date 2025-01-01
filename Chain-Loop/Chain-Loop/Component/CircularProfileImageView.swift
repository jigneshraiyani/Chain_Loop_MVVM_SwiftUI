//
//  CircularProfileImageView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        Image(Constant.Image.loginIcon)
            .resizable()
            .scaledToFit()
            .frame(width: size.dimension,
                   height: size.dimension)
            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: previewData.user,
                                 size: .small)
    }
}
