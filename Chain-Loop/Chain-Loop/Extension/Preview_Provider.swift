//
//  Preview_Provider.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import Foundation
import SwiftUI

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
}
