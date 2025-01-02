//
//  FeedViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/2/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var chains = [Chain]()
    
    init() { Task { try await fetchChains() } }
    
    @MainActor
    func fetchChains() async throws {
        self.chains = try await ChainService.shared.fetchChains()
        try await fetchUserDataForChain()
    }
    
    @MainActor
    func fetchUserDataForChain() async throws {
        for i in 0..<chains.count {
            let chain = chains[i]
            let uid = chain.ownerUid
            let chainUser = try await UserService.shared.fetchUsers(with: uid)
            chains[i].user = chainUser
        }
    }
}
