//
//  Chain_LoopApp.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Chain_LoopApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.buildView(page: .rootView)
                    .navigationDestination(for: AppPages.self) { page in
                        appCoordinator.buildView(page: page)
                    }
            }
            .environmentObject(appCoordinator)
        }
    }
}
