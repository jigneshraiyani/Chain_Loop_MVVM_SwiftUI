//
//  ProfileUserContentView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import SwiftUI

struct ProfileUserContentView: View {
    @State var selectedChain: ProfileChainFilter = .chains
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileChainFilter.allCases.count)
        return UIScreen.main.bounds.width/count - 18
    }
    
    var body: some View {
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
}

struct ProfileUserContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUserContentView()
    }
}
