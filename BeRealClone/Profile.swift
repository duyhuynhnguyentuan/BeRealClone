//
//  Profile.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 03/10/2023.
//

import SwiftUI

struct Profile: View {
    @Binding var mainMenu : String
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                HStack{
                    Button{
                        withAnimation{
                            self.mainMenu = "feed"
                        }
                    }label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Profile")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Spacer()
                    NavigationLink{
                        SettingsView().navigationBarBackButtonHidden()
                    }label: {
                        ThreeDots(size: 4, color: .white)
                    }
                    
                }
                .padding(.horizontal)
            Spacer()
            }
            VStack{
                Image("dudu")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .cornerRadius(75)
                Text("Matcha Huynh")
                    .font(.largeTitle)
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.purple, .blue], startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                Text("@matchacha")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                HStack{
                    Text("Your memories")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                    Spacer()
                    HStack(spacing: 4){
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                        Text("Only visible to you")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 4)
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.white)
                            .opacity(0.07)
                            .frame(height: 230)
                        VStack{
                            HStack{
                                Text("Last 14 days")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .padding(.top, 8)
                            Spacer()
                            }
                            .padding(.leading)
                            VStack{
                                HStack(spacing: 4){
                                    ForEach(1..<8){ x in
                                        MemoryView(day: x)
                                    }
                                }
                                HStack(spacing: 4){
                                    ForEach(1..<8){ x in
                                        MemoryView(day: x)
                                    }
                                }
                                .padding(.top, -4)
                            }
                            .padding(.top, -4)
                            Text("View all my Memories")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 13))
                                .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 2 )
                                    .frame(width: 175, height: 20)
                                )
                                .padding(.top, 4)
                        }
                        .padding(.top, -15)
                    }
                }
                Text("🔗 BeRe.al/matchacha")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
                    .padding(.top, 8)
                Spacer()
            }
            .padding(.top, 35)
        }
    }
}
#Preview {
    Profile(mainMenu: .constant("profile"))
}
