//
//  ImageUploader.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 1/1/25.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI

class ImageUploader {
    static let shared = ImageUploader()
    private init() {}
    
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let storage = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
           let _ = try await storage.putDataAsync(imageData)
            let url = try await storage.downloadURL()
            return url.absoluteString
        } catch  {
            return error.localizedDescription
        }
    }
}
