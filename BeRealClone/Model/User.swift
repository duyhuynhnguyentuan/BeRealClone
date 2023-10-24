//
//  User.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 14/10/2023.
//

import Firebase
import FirebaseFirestoreSwift
struct User: Decodable, Identifiable{
    //Apply the @DocumentID annotation to a DocumentReference? or String? property in a Codable object to have it populated with the document identifier when it is read and decoded from Firestore.
    @DocumentID var id: String?
    var username: String?
    //profileImg var will be optional as the user  gonna define it later
    var profileImageUrl: String?
    var name: String
    var date: String
    var bio: String?
    var location: String?
    var phone: String
    var isCurrentUser: Bool{
        return AuthenticationViewModel.shared.userSession?.uid == id
    }
}
