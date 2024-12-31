//
//  LoginViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - Properties & Object
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    
    //MARK: - LoginViewModel Methods
    init() {}
    
    /// Signin user using auth service using email & password
    func signInUser() async throws {
        do {
            let user = User(emailID: email, password: password)
            try await AuthService.shared.signInUser(user: user)
        } catch {
            print("sign in error in login view model")
        }
    }
    
}
