//
//  User.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String?
    var userName: String?
    var emailID: String
    var password: String
    var phoneNumber: String?
    var bio: String?
    var profileImageURL: String?
}
