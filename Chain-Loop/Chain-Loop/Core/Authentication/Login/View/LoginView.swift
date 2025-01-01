//
//  LoginView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - EnvironmentObject
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    // MARK: - Constant
    let trailingPading = 20.0
    let vStackSpacing = 10.0
    let imageDim = 124.0
    let cornerRadius = 10.0
    
    // MARK: - String Constant
    let emailPlaceHolder = "Enter your email"
    let phonePlaceHolder = "Enter your phone number"
    let passwordPlaceHolder = "Enter your password"
    let forgotButtonTitle = "Forgord Password ?"
    let loginButtonTitle = "Login"
    let donotHaveAccountText = "Don't have any account? "
    let signUp = "Sign up"
    
    
    // MARK: - Properties & Object
    @StateObject private var viewModel = LoginViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: vStackSpacing) {
                Spacer()
                iconImage
                inputFieldView
                forgotView
                loginButtonView
                Spacer()
                Divider()
                footerView
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.theme.backgroundColor)
    }
}

extension LoginView {
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
            TextField(emailPlaceHolder, text: $viewModel.email)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
                .modifier(TextFieldModifier())
            TextField(phonePlaceHolder, text: $viewModel.phoneNumber)
                .modifier(TextFieldModifier())
            SecureField(passwordPlaceHolder, text: $viewModel.password)
                .modifier(TextFieldModifier())
        }
    }
    
    // MARK: - Forgot Password View
    var forgotView: some View {
        NavigationLink {
            Text("Forgot password view")
        } label: {
            Text(forgotButtonTitle)
                .font(.footnote)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.textColor)
                .frame(maxWidth: .infinity,
                       alignment: .trailing)
                .padding(.trailing, trailingPading)
                .padding(.top, 10)
        }
    }
    
    // MARK: - Logon Button View
    var loginButtonView: some View {
        Button {
            Task {
               try await viewModel.signInUser()
              //  appCoordinator.popToRoot()
                appCoordinator.push(page: .chainView)
            }
        } label: {
            Text(loginButtonTitle)
                .modifier(AuthButtonTextModifier())
                .padding(.horizontal)
        }
    }
    
    // MARK: - Footer View
    var footerView: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(donotHaveAccountText)
                Text(signUp)
                    .fontWeight(.heavy)
            }
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(Color.theme.subtextColor)
            .padding(.vertical, 10)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
