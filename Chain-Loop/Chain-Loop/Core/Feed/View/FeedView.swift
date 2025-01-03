//
//  FeedView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
  //      NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.chains) { chain in
                        FeedCell(chain: chain)
                    }
                }
            }
            .refreshable {
                Task { try await ChainService.shared.fetchChains() }
            }
            .navigationTitle("Chain Loop")
            .navigationBarTitleDisplayMode(.inline)
      //  }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    Task { try await ChainService.shared.fetchChains() }
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FeedView()
        }
    }
}
