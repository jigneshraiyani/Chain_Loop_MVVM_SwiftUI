//
//  EditProfileView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/30/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("user name")
                        }
                        Spacer()
                        CircularProfileImageView()
                    }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter Bio Details", text: $bio)
                    }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link", text: $link)
                    }
                    Divider()
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    Divider()
                }
                .font(.footnote)
                .padding()
                .background(Color.theme.backgroundColor)
                .cornerRadius(10)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray3), lineWidth: 1)
                        
                })
                .padding(.horizontal)
                
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        //
                    }
                    .font(.subheadline)
                    .foregroundColor(Color.theme.textColor)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        //
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.textColor)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
