//
//  ProfileChainFilter.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/30/24.
//

import Foundation

enum ProfileChainFilter: Int, CaseIterable, Identifiable {
    case chains = 0
    case replies
    
    var title: String {
        switch self {
        case .chains: return "Chains"
        case .replies: return "Replies"
        }
    }
    var id: Int { return self.rawValue }
}
