//
//  UserCell.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                CircularProfileImageView()
                
                VStack (alignment: .leading){
                    Text("username")
                        .fontWeight(.semibold)
                    Text("sub title")
                }
                .font(.footnote)
                Spacer()
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(minWidth: 100)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.theme.textColor, lineWidth: 1)
                    }
            }
            .padding(.horizontal)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
