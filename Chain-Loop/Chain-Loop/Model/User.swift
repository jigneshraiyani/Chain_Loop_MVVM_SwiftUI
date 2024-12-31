//
//  User.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/31/24.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var emailID: String
    var password: String
    var phoneNumber: String?
    var userName: String?
}
