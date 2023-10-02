//
//  Feed.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 01/10/2023.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            ZStack{
                VStack{
                    VStack{
                        HStack{
                            Image(systemName: "person.2.fill").foregroundColor(.white)
                            Spacer()
                            
                            Text("BeReal.").foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 22))
                            Spacer()
                            Image("dudu")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(17.5)
                        }.padding(.horizontal)
                        HStack{
                            Text("My Friends")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Text("Discovery")
                                .foregroundColor(.gray)
                        }
                    }
               
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Feed()
}
