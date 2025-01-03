//
//  Preview_Provider.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import Foundation
import SwiftUI
import Firebase

extension PreviewProvider {
   static var previewData: PreviewData {
       PreviewData.sharedInstance
    }
}

class PreviewData {
    static let sharedInstance = PreviewData()
    private init() {}
    
    let onBoardModel = OnBoardModel(title: "Set Up Your Profile",
                                    subTitle: "Add a profile picture to show the world who you are. \n Craft a bio to let others know what you’re about.",
                                    image: "Setup_Profile",
                                    color: Color.theme.twilightColor)
    
    let user = User(id: "1234",
                    userName: "jignes",
                    emailID: "jignesh@gmail.com",
                    password: "1234",
                    phoneNumber: "7709577095",
                    bio: "bio details",
                    profileImageURL: "img url")
    
    let chain = Chain(ownerUid: "111", caption: "this is new chain", timestamp: Timestamp(), likes: 0)
}
