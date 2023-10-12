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
    func sendOtp()async{
        if isLoading{return}
        
        do{
            isLoading = true
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
}

