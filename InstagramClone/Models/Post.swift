//
//  Post.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test Caption 1", likes: 121, imageUrl: "image-1", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test Caption 2", likes: 122, imageUrl: "image-1", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test Caption 3", likes: 123, imageUrl: "image-1", timestamp: Date(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test Caption 4", likes: 124, imageUrl: "image-1", timestamp: Date(), user: User.MOCK_USERS[3])
    ]
}
