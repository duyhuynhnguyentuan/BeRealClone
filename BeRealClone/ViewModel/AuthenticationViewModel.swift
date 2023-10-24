//
//  AuthenticationViewModel.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 12/10/2023.
//

import SwiftUI
import Firebase

class AuthenticationViewModel: ObservableObject {
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
    init(){
        //the userSession is handled by firebase securely and is transparent to devs
        //the below userSession using Auth.auth() is handle by Firebase so it basically just check the right current User
        //When the first time download the app the verification has not been completed so there hadn't been a Firebase session yet
        //the usersession is only authenticate the User var type 
        userSession = Auth.auth().currentUser
        fetchUser()
    }
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
    func verifyOtp() async {
        do{
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            let result = try await Auth.auth().signIn(with: credential)
            //create firestone database to save users info
            let db = Firestore.firestore()
            //setData will store dictionary
            db.collection("users").document(result.user.uid).setData([
                "name": name,
                "date": year.date,
                "id": result.user.uid,
                "phone": "+\(country.phoneCode)\(phoneNumber)"
            ]) { err in
                if let err = err {
                    print(err.localizedDescription)
                }
            }
            DispatchQueue.main.async{ [self] in
                self.isLoading = false
                let user = result.user
                self.userSession = user
                self.currentUser = User(name: name, date: year.date, phone: "+\(country.phoneCode)\(phoneNumber)")
                print(user.uid)
            }
        }catch{
            print("ERROR")
            handleError(error: error.localizedDescription)
        }
    }
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    /// The fetchUSer function is used to check if the user is already existed and remain the session
    func fetchUser(){
        //safely guard the constant if userSession?.uid doesn't exist then return and get out of the func
        //The guard let statement is used to unwrap the optional userSession?.uid. If userSession is not nil, and uid is successfully unwrapped (meaning it has a non-nil value), the code inside the guard block will execute. If userSession is nil or uid is nil, the guard statement fails, and the code inside the else block (in this case, return) will execute.
        guard let uid = userSession?.uid else {
            print("No found UID while fetching user")
           
            
            return
        }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else {
                print("Cannot snapshot")
                self.userSession = nil
                return
            }
            self.currentUser = user
            print(user)
            print("ERROR")
        }
    }
    /// saveUserData with the parameter data of type dictionary and is a async function
    func saveUserData(data: [String: Any]) async {
        guard let userID = userSession?.uid else {return}
        do{
           try await Firestore.firestore().collection("users").document(userID).updateData(data as [String: Any])
        }catch{
            handleError(error: error.localizedDescription)
        }
    }
    func uploadProfileImage(image: UIImage, completion: @escaping(String) -> Void){
        ImageUploader.uploadImage(image: image, type: .profile) { url in
            completion(url)
        }
    }
}

