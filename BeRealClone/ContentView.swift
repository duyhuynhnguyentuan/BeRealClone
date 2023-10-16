//
//  ContentView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 01/10/2023.
//

import SwiftUI

struct ContentView: View {
    //the below init() is an alternative for hidden the scroll content background which is available on io 16 and later versions.
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    //the below function is used to create vibrations whenever user click to other views
    func simpleSuccess(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    @State var width = UIScreen.main.bounds.width
    @State var menu = "feed"
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        NavigationView{
            HStack(spacing: 0){
                LeftMenu(mainMenu: $menu)
                    .frame(width: width)
                FeedView(mainMenu: $menu)
                    .frame(width: width)
                Profile(mainMenu: $menu)
                    .frame(width: width)
            }
            .offset(x: menu == "left" ? width : 0)
            .offset(x: menu == "profile" ? -(width) : 0)
            .onChange(of: menu){ newValue in
                simpleSuccess()
            }
        }
    }
}

#Preview {
    ContentView()
}
