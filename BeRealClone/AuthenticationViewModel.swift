//
//  AuthenticationViewModel.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 12/10/2023.
//

import SwiftUI
import Firebase

/*@MainActor*/ class AuthenticationViewModel: ObservableObject {
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country: Country = Country(isoCode: "US")
    @Published var phoneNumber = ""
    @Published var otpText = ""
    @Published var navigationTag: String?
    @Published var isLoading: Bool = false
    @Published var verificationCode: String = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    //for everywhere in the project be able to access the same view model, I declared a shared constant statically
    static let shared = AuthenticationViewModel()
    
    func sendOtp()async{
        if isLoading{return}
        
        do{
            isLoading = true
            //if you cannot find the Reversed ID just enable another google sign in method
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(country.phoneCode)\(phoneNumber)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        }catch{
            handleError(error: error.localizedDescription)
        }
     
    }
    
    func handleError(error: String){
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMessage = error
            self.showAlert.toggle()
        }
    }
    func verifyOtp()async{
        do{
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            let result = try await Auth.auth().signIn(with: credential)
            //create firestone database to save users info
            let db = Firestore.firestore()
            //setData will store dictionary
            db.collection("user").document(result.user.uid).setData([
                "fullname": name,
                "date": year.date,
                "id": result.user.uid
            ]) { err in
                if let err = err {
                    print(err.localizedDescription)
                }
            }
            DispatchQueue.main.async{
                self.isLoading = false
                let user = result.user
                self.userSession = user
                print(user.uid)
            }
        }catch{
            print("ERROR")
            handleError(error: error.localizedDescription)
        }
    }
}

