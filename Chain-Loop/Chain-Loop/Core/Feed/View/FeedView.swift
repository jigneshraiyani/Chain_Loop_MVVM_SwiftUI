//
//  FeedView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
  //      NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...10, id: \.self) { value in
                        FeedCell()
                    }
                }
            }
            .refreshable {
                print("scroll view refresh")
            }
            .navigationTitle("Chain Loop")
            .navigationBarTitleDisplayMode(.inline)
      //  }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
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
