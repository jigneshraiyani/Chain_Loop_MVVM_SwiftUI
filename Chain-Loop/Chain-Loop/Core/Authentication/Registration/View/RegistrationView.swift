//
//  RegistrationView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties & Objects
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Int Constant
    let trailingPading = 20.0
    let vStackSpacing = 10.0
    let imageDim = 124.0
    let cornerRadius = 10.0
    
    // MARK: - String Constant
    let emailPlaceHolder = "Enter your email"
    let phonePlaceHolder = "Enter your phone number"
    let passwordPlaceHolder = "Enter your password"
    let userNamePlaceHolder = "Enter your username"
    let signupButtonTitle = "Sign up"
    let alreadyAccountText = "Alreay have an account? "
    let signinText = "Sign in"

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: vStackSpacing) {
                iconImage
                inputFieldView
                signUpButtonView
                Spacer()
                Divider()
                footerView
            }
        }
        .background(Color.theme.backgroundColor)
    }
}

extension RegistrationView {
    // MARK: - Icon Image
    var iconImage: some View {
        Image(Constant.Image.loginIcon)
            .resizable()
            .scaledToFit()
            .frame(width: imageDim,
                   height: imageDim)
            .padding()
    }
    
    // MARK: - InputField View
    var inputFieldView: some View {
        VStack {
            TextField(emailPlaceHolder,
                      text: $viewModel.email)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
                .modifier(TextFieldModifier())
            TextField(phonePlaceHolder,
                      text: $viewModel.phoneNumber)
                .modifier(TextFieldModifier())
            SecureField(passwordPlaceHolder,
                        text: $viewModel.password)
                .modifier(TextFieldModifier())
            TextField(userNamePlaceHolder,
                      text: $viewModel.username)
                .modifier(TextFieldModifier())

        }
    }
    
    // MARK: - Logon Button View
    var signUpButtonView: some View {
        Button {
            Task {
               try await viewModel.createUserProfile()
            }
        } label: {
            Text(signupButtonTitle)
                .modifier(AuthButtonTextModifier())
                .padding()
        }
    }
    
    // MARK: - Footer View
    var footerView: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Text(alreadyAccountText)
                Text(signinText)
                    .fontWeight(.heavy)
            }
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(Color.theme.subtextColor)
            .padding(.vertical, 10)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
