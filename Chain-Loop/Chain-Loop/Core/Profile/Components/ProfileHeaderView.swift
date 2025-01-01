//
//  ProfileHeaderView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.emailID ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.textColor)
                    Text(user?.userName ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.textColor)
                    Text(user?.phoneNumber  ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.textColor)
                }
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                        .foregroundColor(Color.theme.textColor)
                }
                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(Color.theme.subtextColor)
            }
            Spacer()
            CircularProfileImageView()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: previewData.user)
    }
}
