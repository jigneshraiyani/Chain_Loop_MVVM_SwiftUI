//
//  ChainService.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/2/25.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class ChainService {
    static let shared = ChainService()
    private init () {}
    
    func uploadChain(chain: Chain) async throws {
        guard let chainData = try? Firestore.Encoder().encode(chain) else { return }
        try await Firestore.firestore().collection("chains").addDocument(data: chainData)
    }
    
    func fetchChains() async throws -> [Chain] {
        let snapshot = try await Firestore
            .firestore()
            .collection("chains")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap ( { try? $0.data(as: Chain.self) } )
    }
    
    func fetchUserChains(uid: String) async throws -> [Chain] {
        let snapshot = try await Firestore
            .firestore()
            .collection("chains")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        let chains = snapshot.documents.compactMap( { try? $0.data(as: Chain.self) } )
        return chains.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        
    }
}
