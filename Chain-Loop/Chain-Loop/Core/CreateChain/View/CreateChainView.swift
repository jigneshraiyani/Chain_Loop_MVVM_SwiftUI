//
//  CreateChainView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct CreateChainView: View {
    @StateObject var viewModel = CreateChainViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
  //      NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user,
                                             size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.userName ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        TextField("Start a chain ....",
                                  text: $viewModel.chainCaption,
                                  axis: .vertical)
                            .font(.footnote)
                            .foregroundColor(Color.theme.subtextColor)
                    }
                    Spacer()
                    if !viewModel.chainCaption.isEmpty {
                        Button {
                            viewModel.chainCaption = ""
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
                        Task { try await viewModel.uploadChain() }
                    }
                    .opacity(viewModel.chainCaption.isEmpty ? 0.5 : 1.0)
                    .disabled(viewModel.chainCaption.isEmpty)
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
