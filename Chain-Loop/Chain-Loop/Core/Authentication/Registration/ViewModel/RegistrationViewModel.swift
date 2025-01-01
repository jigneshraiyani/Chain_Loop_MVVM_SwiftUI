//
//  RegistrationViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    // MARK: - Properties & Objects
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    
    // MARK: RegistrationViewModel Methods
    init() {}
    
    /// Method to call user profile
    /// - Throws: Throw error if userProfile creation fails
    func createUserProfile() async throws {
        let user = User(userName: username,
                        emailID: email,
                        password: password,
                        phoneNumber: phoneNumber,
                        bio: "bio detailss",
                        profileImageURL: "www.google.com/profile")
        try await AuthService.shared.createUser(user: user)
    }
}
