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
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        subscribeToUserSession()
    }
    
    func subscribeToUserSession() {
        AuthService.shared.$userSession
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userSession in
                self?.userSession = userSession
                print("setup user session in rootView model = \(self?.userSession)")
            }.store(in: &cancellable)
    }
}
