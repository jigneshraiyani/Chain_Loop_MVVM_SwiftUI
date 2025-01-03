//
//  ProfileView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .modifier(AuthButtonTextModifier())
                }
                ProfileUserContentView(user: user)
            }
        }
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: previewData.user)
    }
}
