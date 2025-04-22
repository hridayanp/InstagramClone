//
//  User.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Codable, Hashable {
    var id: String
    
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Test Developer", profileImageUrl: "image-1", fullname: "Dev fullname", bio: "Some Dev bio", email: "dev@test.com"),
        .init(id: NSUUID().uuidString, username: "Test Dev 2", profileImageUrl: "image-1", fullname: "Dev fullname 2", bio: "Some Dev bio 2", email: "de2v@test.com"),
        .init(id: NSUUID().uuidString, username: "Test Developer 3", profileImageUrl: "image-1", fullname: "Dev fullname 3", bio: "Some Dev bio 3", email: "dev3@test.com"),
        .init(id: NSUUID().uuidString, username: "Test Developer 4", profileImageUrl: "image-1", fullname: "Dev fullname 4", bio: "Some Dev bio 4", email: "dev4@test.com"),
    ]
}
