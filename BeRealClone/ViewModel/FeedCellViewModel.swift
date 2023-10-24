//
//  FeedCellViewModel.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 23/10/2023.
//

import SwiftUI
import Firebase

class FeedCellViewModel : ObservableObject {
    @Published var beReal: BeReal
    init(beReal: BeReal) {
        self.beReal = beReal
        fetchBeRealUser()
    }
    func fetchBeRealUser(){
        Firestore.firestore().collection("users").document(beReal.userId).getDocument() { snap, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.beReal.user = try? snap?.data(as: User.self)
        }
    }
}
