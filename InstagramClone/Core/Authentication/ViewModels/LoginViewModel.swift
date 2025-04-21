//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 21/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
