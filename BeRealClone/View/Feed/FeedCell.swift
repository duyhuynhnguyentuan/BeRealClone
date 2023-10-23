//
//  FeedCell.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 01/10/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading){
                //USERNAME
                HStack{
                    Image("dudu")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    VStack(alignment:.leading){
                        Text("Matcha Huynh")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        Text("Dong Xoai • 2 hr")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
                
                // IMAGE
                ZStack{
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName: "bubble.left.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                                Image(systemName: "face.smiling.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                                    .padding(.top,20)
                            }
                            .padding(.trailing,40)
                            .padding(.bottom, 70)
                        }
                    }
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    VStack{
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        Text("Add a comment...")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .background(.gray)
                            .cornerRadius(20)
                    }
                    VStack{
                        HStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                                .frame(width:125, height: 165)
                                .overlay(
                                    
                                    Image("front")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(width: 120, height: 160)
                                )
                                .padding(.leading)
                            Spacer()
                        }
                        .padding(.top, 18)
                        Spacer()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
            
        }
    }
}

#Preview {
    FeedCell()
}
