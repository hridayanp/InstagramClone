//
//  AuthService.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 21/04/25.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init () {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
           
            self.userSession = result.user
        }
        
        catch {
            print("DEBUG: failed to register user with error \(error.localizedDescription)")
        }
        
    }
    
    func loadUserData() async throws -> User {
        User(id: "123", username: "testuser", email: "test@example.com")
    }
    
    func signOut() {
        
    }
}
