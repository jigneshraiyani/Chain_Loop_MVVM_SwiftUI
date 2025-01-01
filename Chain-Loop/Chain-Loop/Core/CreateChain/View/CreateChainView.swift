//
//  CreateChainView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct CreateChainView: View {
    @Environment(\.dismiss) var dismiss
    @State private var chainText: String = ""
    
    var body: some View {
  //      NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: nil,
                                             size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("user name")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        TextField("Start a chain ....", text: $chainText, axis: .vertical)
                            .font(.footnote)
                            .foregroundColor(Color.theme.subtextColor)
                    }
                    Spacer()
                    if !chainText.isEmpty {
                        Button {
                            chainText = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color.theme.textColor)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Chain")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(Color.theme.textColor)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        //
                    }
                    .opacity(chainText.isEmpty ? 0.5 : 1.0)
                    .disabled(chainText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.textColor)
                }
            }
 //       }
    }
}

struct CreateChainView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChainView()
    }
}
