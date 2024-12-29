//
//  FeedCel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                CircularProfileImageView()
                VStack(alignment: .leading, spacing: 4) {
                    HStack() {
                        Text("user name")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.textColor)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color.theme.subtextColor)
                        Button {
                            //
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color.theme.textColor)
                        }
                    }
                    Text("configuration dictionary (looking for configuration named Subline text")
                        .font(.footnote)
                        .foregroundColor(Color.theme.subtextColor)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Button {
                            //
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                            //
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        Button {
                            //
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button {
                            //
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(Color.theme.textColor)
                    .padding(.vertical, 6)
                }
            }
            Divider()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
    }
}

struct FeedCel_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
