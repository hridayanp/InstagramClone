//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 22/04/25.
//

import Firebase
import SwiftUI
import PhotosUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {await loadImage(fromItem: selectedImage)}
        }
    }
    
    @Published var profileImage: Image?
    
    @Published var fullname: String = ""
    @Published var bio: String = ""
    
    init(user: User) {
        self.user = user
    }
    
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
    
    func updateUserData() async throws {
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
           let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            print("DEBUG: Update fullname \(fullname)")
            data["fullname"] = fullname
            
        }
        
        
        if !bio.isEmpty && user.bio != bio {
            print("DEBUG: Update bio \(bio)")
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
