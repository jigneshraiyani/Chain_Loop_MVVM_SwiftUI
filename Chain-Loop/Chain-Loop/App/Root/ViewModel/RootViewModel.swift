//
//  RootViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation
import Combine
import Firebase

class RootViewModel: ObservableObject {
   @Published var userSession: FirebaseAuth.User?
    
    init() {
        subscribeToUserSession()
    }
    
    func subscribeToUserSession() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
    }
}
