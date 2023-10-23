//
//  CameraViewModel.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 23/10/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

 class CameraViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    func takePhoto(backImage: UIImage, frontImage: UIImage, completion: @escaping(String, String) -> Void){
        ImageUploader.uploadImage(image: backImage, type: .post) { urlBackImage in
            ImageUploader.uploadImage(image: frontImage, type: .post) { urlFrontImage in
                completion(urlBackImage, urlFrontImage)
            }
        }
    }
    func postBeReal(frontImgUrl: String, backImgUrl: String) async {
        let db = Firestore.firestore()
        let date  = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy"
        
        let dateString = formatter.string(from: date)
        print(dateString)
        do{
           try await db.collection("posts").document("\(dateString)").collection("bereals").document(user.id!)
                .setData([
                    "frontImageUrl" : frontImgUrl,
                    "backImageUrl" : backImgUrl,
                    "userId" : user.id,
                    "username" : user.name
                ])
        }catch{
            print(error.localizedDescription)
        }
    }
}
