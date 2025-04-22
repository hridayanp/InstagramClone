//
//  UserService.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 22/04/25.
//

import Foundation
import Firebase

struct UserService {
    
   
    static func fetchAllUser() async throws -> [User] {
     
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self )})
    }
}
