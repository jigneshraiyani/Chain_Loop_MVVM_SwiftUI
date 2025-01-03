//
//  ProfileUserContentViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/2/25.
//

import Foundation

class ProfileUserContentViewModel: ObservableObject {
    @Published var chains = [Chain]()
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserChain() }
    }
    
    @MainActor
    func fetchUserChain() async throws {
        self.chains = try await ChainService.shared.fetchUserChains(uid: user.id ?? "")
        
        for i in 0..<chains.count {
            var chain = chains[i]
            chain.user = user
        }
        self.chains = chains
    }
}
