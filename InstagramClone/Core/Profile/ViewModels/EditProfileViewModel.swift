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
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {await loadImage(fromItem: selectedImage)}
        }
    }
    
    @Published var profileImage: Image?
    
    @Published var fullname: String = ""
    @Published var bio: String = ""
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        
        guard let uiImage = UIImage(data: data) else {return}
        
        self.profileImage = Image(uiImage: uiImage)
    }
}
