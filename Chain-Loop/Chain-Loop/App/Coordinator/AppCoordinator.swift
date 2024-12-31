//
//  AppCoordinator.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/30/24.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
   @Published var path: NavigationPath =  NavigationPath()
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func buildView(page: AppPages) -> some View {
        switch page {
        case .rootView:
            RootView()
        case .onboardView:
            OnBoardingView()
        case .loginView:
            LoginView()
        case .chainView:
            ChainTabView()
        }
    }
}
