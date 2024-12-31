//
//  RootView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    @ViewBuilder var body: some View {
        Group {
            if viewModel.userSession != nil {
                appCoordinator.buildView(page: .chainView)
            } else {
                appCoordinator.buildView(page: .onboardView)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
