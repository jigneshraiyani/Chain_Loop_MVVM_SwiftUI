//
//  Chain.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/2/25.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Chain: Identifiable, Codable {
    @DocumentID var chainID: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        chainID ?? NSUUID().uuidString
    }
    
    var user: User?
}
