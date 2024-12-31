//
//  ExploreView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
//        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(Range(0...1), id: \.self) { value in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search Chain")
       // }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
