//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct AddEmailView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing:12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 360)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Enter your email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUsernameView()
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
    AddEmailView()
}
