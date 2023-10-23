//
//  MainAuthenticationView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 12/10/2023.
//

import SwiftUI

struct MainAuthenticationView: View {
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneNumberButtonClicked = false
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        NavigationView{
            if !nameButtonClicked {
                EnterNameView(name: $viewModel.name, nameButtonClicked: $nameButtonClicked)
                    .environmentObject(viewModel)
            }
            else if nameButtonClicked && !ageButtonClicked {
                EnterAgeView(year: $viewModel.year, name: $viewModel.name, ageButtonClicked: $ageButtonClicked)
            }
            else if nameButtonClicked && ageButtonClicked && !phoneNumberButtonClicked{
                EnterPhoneNumberView(phoneNumberButtonClicked: $phoneNumberButtonClicked)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    MainAuthenticationView()
}
