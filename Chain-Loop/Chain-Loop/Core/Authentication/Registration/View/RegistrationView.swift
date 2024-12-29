//
//  RegistrationView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Constant
    let trailingPading = 20.0
    let vStackSpacing = 10.0
    let imageDim = 124.0
    let cornerRadius = 10.0

    
    // MARK: - Properties
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @Environment(\.dismiss) var dismiss
    
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
            TextField("Enter your email", text: $email)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            TextField("Enter your phone number", text: $phoneNumber)
                .modifier(TextFieldModifier())
            SecureField("Enter your password", text: $password)
                .modifier(TextFieldModifier())
            TextField("Enter your username", text: $username)
                .modifier(TextFieldModifier())

        }
    }
    
    // MARK: - Logon Button View
    var signUpButtonView: some View {
        Button {
            //
        } label: {
            Text("Sign up")
                .modifier(AuthButtonTextModifier())
        }
    }
    
    // MARK: - Footer View
    var footerView: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Text("Alreay have an account? ")
                Text("Sign in")
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
