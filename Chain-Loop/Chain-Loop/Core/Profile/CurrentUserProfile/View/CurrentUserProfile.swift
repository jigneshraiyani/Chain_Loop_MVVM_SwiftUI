//
//  CurrentUserProfile.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import SwiftUI

struct CurrentUserProfile: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State var showEditProfile: Bool = false
    
    private var currentUser: User? {
        viewModel.currentUser
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: currentUser)
                Button {
                    showEditProfile = true
                } label: {
                    Text("Edit Profile")
                        .modifier(AuthButtonTextModifier())
                }
                ProfileUserContentView()
            }
        }
        .sheet(isPresented: $showEditProfile, content: {
            if let user = currentUser {
                EditProfileView(user: user)
            }
        })
        .padding(.horizontal)
    }
}

struct CurrentUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfile()
    }
}
