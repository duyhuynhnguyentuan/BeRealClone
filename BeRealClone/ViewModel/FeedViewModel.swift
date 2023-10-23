//
//  FeedViewModel.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 23/10/2023.
//

import SwiftUI
import Firebase
class FeedViewModel: ObservableObject {
    @Published var bereals = [BeReal]()
    let user: User
    init(user: User){
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy"
        let dateString = formatter.string(from: date)
        self.user = user
        Task{
            await fetchData(date: dateString)
        }
    }
    func fetchData(date: String) async {
        let db = Firestore.firestore()
        do{
            let data = try await db.collection("posts").document(date).collection("bereals").getDocuments()
            self.bereals = data.documents.compactMap({ try? $0.data(as: BeReal.self)})
        }catch{
            print(error.localizedDescription)
        }
    }
}
