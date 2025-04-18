//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing:12) {
            Text("Create Profile")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 360)
                .padding(.top)
            
            Text("You'll use this profile to sign in to your account")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Username", text: $email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            SecureField("Password", text: $password)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                SignupCompleteView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(IGButtonModifier())
            }
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CreateUsernameView()
}
