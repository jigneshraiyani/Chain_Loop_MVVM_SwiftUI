//
//  ExploreViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.shared.fetchAllUsers()
    }
}
