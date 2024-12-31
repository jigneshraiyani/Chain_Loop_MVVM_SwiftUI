//
//  OnBoardingCardView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/28/24.
//

import SwiftUI

struct OnBoardingCardView: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject private var appCoordinator: AppCoordinator
    let onBoardModel: OnBoardModel
    
    // MARK: - Constant
    let continueButtonTitle = "Continue"
    let continueButtonImage = "arrow.right.circle"
    let radius = 10.0
    let opacity = 0.4
    let spacing = 20.0
    let continueButtonHPadding = 50.0
    let continueButtonVPadding = 15.0

    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: spacing) {
                cardImage
                titleText
                subTitleText
                continueButton
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        }
        .background(onBoardModel.color)
        .cornerRadius(radius)
    }
}

extension OnBoardingCardView {
    // MARK: - Card Image
    var cardImage: some View {
        Image(onBoardModel.image)
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: opacity),
                    radius: radius)
            .padding(.all)
    }
    
    // MARK: - Title Image
    var titleText: some View {
        Text(onBoardModel.title)
            .foregroundColor(Color.theme.textColor)
            .font(.title)
            .fontWeight(.heavy)
        
    }
    
    // MARK: - SubTitle Image
    var subTitleText: some View {
        Text(onBoardModel.subTitle)
            .foregroundColor(Color.theme.subtextColor)
            .font(.title2)
            .multilineTextAlignment(.center)
    }
    
    // MARK: - Continue Button
    var continueButton: some View {
        Button {
            appCoordinator.push(page: .loginView)
        } label: {
            HStack(spacing: spacing) {
                Text(continueButtonTitle)
                Image(systemName: continueButtonImage)
                    .imageScale(.medium)
            }
            .foregroundColor(Color.theme.accentColor)
            .padding(.horizontal, continueButtonHPadding)
            .padding(.vertical, continueButtonVPadding)
            .fontWeight(.heavy)
            .background(
                Capsule().strokeBorder(Color.theme.accentColor, lineWidth: 1.25)
              )
        }
    }
}

struct OnBoardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingCardView(onBoardModel: PreviewData.sharedInstance.onBoardModel)
    }
}
