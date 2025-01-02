//
//  CreateChainViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/2/25.
//

import Foundation
import Firebase

class CreateChainViewModel: ObservableObject {
    @Published var chainCaption: String = ""
    
    func uploadChain() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let chain = Chain(ownerUid: uid,
                          caption: chainCaption,
                          timestamp: Timestamp(),
                          likes: 0)
        try await ChainService.shared.uploadChain(chain: chain)
    }
}
