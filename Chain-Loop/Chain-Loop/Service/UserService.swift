//
//  UserService.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    private init() {
        Task {
            try await self.fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try data.data(as: User.self)
        self.currentUser = user
        print("current user in user service is = \(self.currentUser)")
    }
    
    @MainActor
    func fetchAllUsers() async throws -> [User] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        let userData = try await Firestore.firestore().collection("users").getDocuments()
        let users = userData.documents.compactMap( { try? $0.data(as: User.self) } )
        return users.filter( { $0.id != uid } )
    }
    
    @MainActor
    func reset() {
        self.currentUser = nil
    }
}
