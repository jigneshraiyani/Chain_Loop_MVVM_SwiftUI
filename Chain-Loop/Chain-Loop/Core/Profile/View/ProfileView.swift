//
//  ProfileView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State var selectedChain: ProfileChainFilter = .chains
    @Namespace var animation
    
    private var currentUser: User? {
        viewModel.currentUser
    }
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileChainFilter.allCases.count)
        return UIScreen.main.bounds.width/count - 18
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.emailID ?? "")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.textColor)
                            Text(currentUser?.userName ?? "")
                                .font(.subheadline)
                                .foregroundColor(Color.theme.textColor)
                            Text(currentUser?.phoneNumber ?? "")
                                .font(.subheadline)
                                .foregroundColor(Color.theme.textColor)
                        }
                        if let bio = currentUser?.bio {
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
                Button {
                    
                } label: {
                    Text("Follow")
                        .modifier(AuthButtonTextModifier())
                }
                VStack {
                    HStack {
                        ForEach(ProfileChainFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedChain == filter ? .semibold : .regular)
                                if selectedChain == filter {
                                        Rectangle()
                                            .foregroundColor(Color.theme.textColor)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "filter", in: animation)
                                } else {
                                        Rectangle()
                                            .foregroundColor(Color.theme.subtextColor)
                                            .frame(width: filterBarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedChain = filter
                                }
                            }
                        }
                    }
                    LazyVStack {
                        ForEach(Range(0...5), id: \.self) { chain in
                            FeedCell()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
