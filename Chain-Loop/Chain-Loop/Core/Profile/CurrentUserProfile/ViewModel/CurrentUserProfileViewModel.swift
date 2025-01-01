//
//  CurrentUserProfileViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var anycancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscriber()
    }
    
    func setupSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("current user in profile view model is = \(user)")
        }.store(in: &anycancellable)
    }
}
