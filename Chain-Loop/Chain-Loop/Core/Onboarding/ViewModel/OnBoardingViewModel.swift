//
//  OnBoardingViewModel.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import Foundation
import SwiftUI

class OnBoardingViewModel {
    init() {}
    
    func getOnBoardData() -> [OnBoardModel] {
        return [
            OnBoardModel(title: "Set Up Your Profile",
                         subTitle: "Add a profile picture to show the world who you are. \n Craft a bio to let others know what you’re about.",
                         image: "Setup_Profile",
                         color: Color.theme.twilightColor),
            OnBoardModel(title: "Explore Your Feed",
                         subTitle: "Follow accounts you find interesting to start building your feed. \n Search for topics, hashtags, or users you’re curious about.",
                         image: "Explore_Profile",
                         color: Color.theme.twilightColor),
            OnBoardModel(title: "Compose Your First Chain",
                         subTitle: "Tap the + button to share your thoughts. \n Add images, polls, or GIFs to make your chain pop.",
                         image: "First_Chain",
                         color: Color.theme.twilightColor),
            OnBoardModel(title: "Engage with Others",
                         subTitle: "Like and posts you enjoy. \n Reply to chains and start conversations.",
                         image: "Engage",
                         color: Color.theme.twilightColor)
        ]
    }
}
