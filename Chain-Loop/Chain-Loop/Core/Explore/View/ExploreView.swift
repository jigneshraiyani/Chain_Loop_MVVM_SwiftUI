//
//  ExploreView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    @State private var searchText = ""
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        VStack {
                            UserCell(user: user)
                            Divider()
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
        }
        .navigationDestination(for: User.self, destination: { user in
            ProfileView(user: user)
        })
        .searchable(text: $searchText, prompt: "Search Chain")
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
