//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/10/2023.
//

import SwiftUI

struct EditProfileView: View {
    @State var width = UIScreen.main.bounds.width
    @State var fullname = ""
    @State var username = ""
    @State var bio = ""
    @State var location = ""
    //@Environment(\.dismiss) is a property wrapper in SwiftUI that allows you to dismiss a view programmatically. It is used to dismiss a view that was presented modally using the sheet() modifier
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        HStack{
                            Button{
                                dismiss()
                            }label: {
                                Text("Cancel")
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Text("Save")
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, width * 0.05)
                        Text("Edit profile")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    HStack{
                        Spacer()
                        Rectangle()
                            .frame(width: width * 0.95 , height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    }
                Spacer()
                }
                VStack{
                    VStack{
                        ZStack(alignment: .bottomTrailing){
//                            Image("dudu")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 120,height: 120)
//                                .cornerRadius(60)
                            Circle()
                                .frame(width: 120,height: 120)
                                .cornerRadius(60)
                                .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                .overlay(
                                    Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                        .foregroundColor(.white)
                                        .font(.system(size: 55))
                                )
                            ZStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 34, height: 34)
                                        .foregroundColor(.black)
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                }
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 16))
                                    .shadow(color: .white ,radius: 1, x: 1, y: 1)
                            }
                        }
                            
                    }
                    //MENU
                    VStack{
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack{
                            HStack{
                                Text("Full Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            HStack{
                                TextField("", text: $fullname)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullname.isEmpty){
                                        Text("Matcha Huynh")
                                            .foregroundStyle(
                                                .linearGradient(
                                                    colors: [.purple, .blue], startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .opacity(0.7)                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack{
                            HStack{
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            HStack{
                                TextField("", text: $username)
                                    .font(.system(size: 16))
                                    .placeholder(when: username.isEmpty){
                                        Text("matchacha")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack(alignment: .top){
                            HStack{
                                Text("Bio")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .padding(.leading, -4)
                            .frame(width: width * 0.2 )
                            //The .scrollContentBackground is only available on ios 16 or later
                            if #available(iOS 16, *){
                                TextEditor(text: $bio)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 100)
                                    .padding(.leading, width * 0.05)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                if bio.isEmpty {
                                                    Text("Bio")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 16))
                                                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                                        .padding(.top, 8)
                                                        .padding(.leading, 24)
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                        }
                                    )
                                    .padding(.top, -5)
                                    .frame(width: width * 0.63)
                            }
                        }
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack{
                            HStack{
                                Text("Location")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            HStack{
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .placeholder(when: location.isEmpty){
                                        Text("Location")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            }
        }
    }
}

#Preview {
    EditProfileView()
}
