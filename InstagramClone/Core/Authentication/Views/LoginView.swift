//
//  LoginView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("insta-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Password", text: $password)
                        .modifier(IGTextFieldModifier())
                }
                
                Button {
                    print("SHow forgot pass")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                
                
                Button {
                    print("Login")
                } label: {
                    Text("Login")
                        .modifier(IGButtonModifier())
                       
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                       
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        .fontWeight(.semibold)
                        
                }
                .foregroundColor(.gray)
                
                
                Button {
                    print("FB login")
                } label: {
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        
                        Text("Sign Up").fontWeight(.semibold)
                            
                    }
                    .font(.footnote)
                    
                    .padding(.vertical, 16)
                }

            }
        }
    }
}

#Preview {
    LoginView()
}
