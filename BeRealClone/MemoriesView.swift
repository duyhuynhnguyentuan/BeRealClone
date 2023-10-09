//
//  MemoriesView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 09/10/2023.
//

import SwiftUI

struct MemoriesView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("Memories")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                        }
                    }
                Spacer()
                }
                VStack{
                    VStack{
                        HStack{
                            Text("Your memories are activated")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                            Spacer()
                        }
                        Text("All your BeReal are automatically added to your Memories and only visible to you.")
                            .foregroundStyle(.white)
                            .padding(.top, -2)
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 210)
                            .foregroundColor(Color(red: 22/255, green: 4/255, blue: 3/255))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.red, lineWidth: 1)
                            )
                        VStack(alignment: .leading){
                            HStack{
                                Text("Deactivate and Delete Memories")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Spacer()
                            }
                            VStack{
                                HStack{
                                    Text("If you deactivate your Memories, all your BeReal will be permanently deleted and unrecoverable")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                HStack{
                                    Text("All your future BeReal won't be saved in Memories and will be automatically deleted as well.")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                            }
                            .padding(.top, -6)
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.width * 0.5,height: 40)
                                .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                                .overlay(
                                    Text("Deactivate Memories")
                                        .foregroundColor(.red)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                )
                                .padding(.top, 8)
                        }
                        .padding(.leading)
                    }
                    .padding(.top, 22)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    MemoriesView()
}
