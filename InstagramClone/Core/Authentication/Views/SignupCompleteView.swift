//
//  SignupCompleteView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct SignupCompleteView: View {
  
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing:12) {
            Spacer()
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 360)
                .padding(.top)
            

            Text("Click below to complete registration and start using Instagram")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Button {
               Task {
                   try await viewModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
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
    SignupCompleteView()
}
