//
//  AuthService.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation
import Firebase

class AuthService: ObservableObject {
    // MARK: - Properties & Objects
    @Published var userSession: FirebaseAuth.User?
    
    // MARK: Singleton instance for Auth Service
    static let shared = AuthService()
    
    // MARK: AuthService Methods
    private init() {
        userSession = Auth.auth().currentUser
    }
    
    /// Login user using Firebase Login service
    /// - Parameter user: User model object having email & password
    func signInUser(user: User) async throws {
        do {
            let result =  try await Auth.auth().signIn(withEmail: user.emailID,
                                                           password: user.password)
            self.userSession = result.user
            print("user signin = \(result.user.uid)")
        } catch let error {
            print("error during user creation = \(error.localizedDescription)")
        }

    }
    
    /// Register user using Firebase Auth service
    /// - Parameter user: User model object having email & password
    func createUser(user: User) async throws {
        do {
            let result =  try await Auth.auth().createUser(withEmail: user.emailID,
                                                           password: user.password)
            self.userSession = result.user
            print("user creation = \(result.user.uid)")
        } catch let error {
            print("error during user creation = \(error.localizedDescription)")
        }
    }
    
    /// Logoff user locally and make userSession nil
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
