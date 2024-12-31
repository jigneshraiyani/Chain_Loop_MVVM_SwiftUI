//
//  AppPages.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/30/24.
//

import Foundation

enum AppPages: Identifiable, Hashable {
    case rootView
    case onboardView
    case loginView
    case chainView
    
    var id: String {
        switch self {
        case .rootView:
            return self.hashValue.description
        case .onboardView:
            return self.hashValue.description
        case .loginView:
            return self.hashValue.description
        case .chainView:
            return self.hashValue.description
        }
    }
}
