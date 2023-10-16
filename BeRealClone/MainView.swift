//
//  MainView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 14/10/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                MainAuthenticationView()
            }else{
                if viewModel.currentUser != nil{
                    ContentView()
                }else{
                    VStack{
                        ZStack{
                            Color.black.ignoresSafeArea()
                            VStack{
                                HStack{
                                    Spacer()
                                    Text("BeReal.")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 22))
                                    Spacer()
                                }
                                
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}

#Preview {
    MainView()
}
