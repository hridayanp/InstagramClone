//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 22/04/25.
//

//import UIKit
//import Firebase
//import FirebaseStorage
//
//struct ImageUploader {
//    static func uploadImage(image: UIImage) async throws -> String? {
//        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
//        
//        let filename = NSUUID().uuidString
//        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
//        
//        do {
//            let _ = try await ref.putDataAsync(imageData)
//            let url = try await ref.downloadURL()
//            return url.absoluteString
//        }
//        catch {
//            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
//            return nil
//        }
//    }
//}


import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<String?, Error>) in
            ref.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                ref.downloadURL { url, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let downloadURL = url {
                        continuation.resume(returning: downloadURL.absoluteString)
                    } else {
                        continuation.resume(returning: nil)
                    }
                }
            }
        }
    }
}
