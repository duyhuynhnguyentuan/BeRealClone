//
//  AuthenticationViewModel.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 12/10/2023.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
       @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country: Country = Country(isoCode: "VN")
    @Published var phoneNumber = ""
    @Published var otpText = ""
    @Published var navigationTag: String?
    func sendOtp(){
        self.navigationTag = "VERIFICATION"
    }
}

