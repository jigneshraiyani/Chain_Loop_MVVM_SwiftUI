//
//  AuthService.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService: ObservableObject {
    // MARK: - Properties & Objects
    @Published var userSession: FirebaseAuth.User?
    
    // MARK: Singleton instance for Auth Service
    static let shared = AuthService()
    
    // MARK: AuthService Methods
    private init() {
        userSession = Auth.auth().currentUser
    }
    
    @MainActor
    /// Login user using Firebase Login service
    /// - Parameter user: User model object having email & password
    func signInUser(user: User) async throws {
        do {
            let result =  try await Auth.auth().signIn(withEmail: user.emailID,
                                                           password: user.password)
            self.userSession = result.user
            print("user signin = \(result.user.uid)")
            try await UserService.shared.fetchCurrentUser()
        } catch let error {
            print("error during user creation = \(error.localizedDescription)")
        }

    }
    
    @MainActor
    /// Register user using Firebase Auth service
    /// - Parameter user: User model object having email & password
    func createUser(user: User) async throws {
        do {
            let result =  try await Auth.auth().createUser(withEmail: user.emailID,
                                                           password: user.password)
            self.userSession = result.user
            print("user creation = \(result.user.uid)")
            let user = User(id: result.user.uid,
                            userName: user.userName,
                            emailID: user.emailID,
                            password: user.password,
                            phoneNumber: user.phoneNumber,
                            bio: user.bio,
                            profileImageURL: user.profileImageURL)
            try await uploadUserData(user: user)
        } catch let error {
            print("error during user creation = \(error.localizedDescription)")
        }
    }
    
    @MainActor
    /// Logoff user locally and make userSession nil
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
    func uploadUserData(user: User) async throws {
        guard let id = user.id else { return }
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
