//
//  AuthService.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation
import Firebase

class AuthService {
    // MARK: - Properties & Objects
    @Published var userSession: FirebaseAuth.User?
    
    // MARK: Singleton instance for Auth Service
    static let shared = AuthService()
    
    // MARK: AuthService Methods
    private init() {
        userSession = Auth.auth().currentUser
    }
    
    /// Register user using Firebase Auth service
    /// - Parameter user: User model object having email & password
    func createUser(user: User) async throws {
        do {
            let result =  try await Auth.auth().createUser(withEmail: user.emailID,
                                                           password: user.password)
            print("user creation = \(result.user.uid)")
        } catch let error {
            print("error during user creation = \(error.localizedDescription)")
        }
    }
}
