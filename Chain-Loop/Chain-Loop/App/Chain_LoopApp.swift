//
//  Chain_LoopApp.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import SwiftUI

@main
struct Chain_LoopApp: App {
    @AppStorage("isOnBoarded") var isOnBoarded = false
    
    var body: some Scene {
        WindowGroup {
            if !isOnBoarded {
                OnBoardingView()
            } else {
               // LoginView()
                ChainTabView()
            }
        }
    }
}
