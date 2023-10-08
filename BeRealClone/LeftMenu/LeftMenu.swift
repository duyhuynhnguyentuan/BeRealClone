//
//  LeftMenu.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 07/10/2023.
//

import SwiftUI

struct LeftMenu: View {
    
    @State var width = UIScreen.main.bounds.width
    @State var menu =  "suggestions"
    @Binding var mainMenu : String
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                LeftMenuTopView(mainMenu: $mainMenu)
                switch menu {
                case "suggestions": Suggestions()
                case "friends" : FriendsView()
                case "requests": RequestsView()
                
                default:
                    Text("There's an error ⚠️")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                    
                }
                VStack{
                    Spacer()
                    ZStack{
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: width * 0.7, height: 40)
                                    .foregroundColor(Color(red: 20/255, green: 20/255, blue: 20/255))
                                HStack(spacing: 4){
                                    Capsule()
                                        .frame(width: 100, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "suggestions" ? 1 : 0)
                                        .overlay(
                                        Text("Suggestions")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        ).onTapGesture {
                                            self.menu = "suggestions"
                                        }
                                    Capsule()
                                        .frame(width: 70, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "friends" ? 1 : 0)
                                        .overlay(
                                        Text("Friends")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        ).onTapGesture {
                                            self.menu = "friends"
                                        }
                                    Capsule()
                                        .frame(width: 75, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "requests" ? 1 : 0)
                                        .overlay(
                                        Text("Requests")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        ).onTapGesture {
                                            self.menu = "requests"
                                        }

                                }
                            }
                        }
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        LinearGradient(colors: [.black,.white.opacity(0)], startPoint: .bottom, endPoint: .top)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .opacity(0.9)
                    }
                }
            }
        }
    }
}

#Preview {
    LeftMenu(mainMenu: .constant("left"))
}

