//
//  LoginView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Constant
    let trailingPading = 20.0
    let vStackSpacing = 10.0
    let imageDim = 124.0
    let cornerRadius = 10.0

    
    // MARK: - Properties
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
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
            .background(Color.theme.backgroundColor)
        }
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
            TextField("Enter your email", text: $email)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            TextField("Enter your phone number", text: $phoneNumber)
                .modifier(TextFieldModifier())
            SecureField("Enter your password", text: $password)
                .modifier(TextFieldModifier())

        }
    }
    
    // MARK: - Forgot Password View
    var forgotView: some View {
        NavigationLink {
            Text("Forgot password view")
        } label: {
            Text("Forgord Password ?")
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
            //
        } label: {
            Text("Login")
                .modifier(AuthButtonTextModifier())
        }
    }
    
    // MARK: - Footer View
    var footerView: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text("Don't have any account? ")
                Text("Sign up")
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
