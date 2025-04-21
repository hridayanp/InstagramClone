//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
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
            
            TextField("Username", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            SecureField("Password", text: $viewModel.password)
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
