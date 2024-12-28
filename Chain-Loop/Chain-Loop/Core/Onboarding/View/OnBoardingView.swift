//
//  OnBoardingView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import SwiftUI

struct OnBoardingView: View {
    let viewModel = OnBoardingViewModel()

    var body: some View {
        TabView {
            ForEach(viewModel.getOnBoardData(), id: \.id) {  onboardModel in
                OnBoardingCardView(onBoardModel: onboardModel)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.all)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
