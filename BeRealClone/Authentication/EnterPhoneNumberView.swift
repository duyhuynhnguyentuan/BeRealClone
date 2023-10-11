//
//  EnterPhoneNumberView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 11/10/2023.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                
                    Spacer()
                }
                VStack(alignment: .center, spacing:8){
                    Text("Create your account using your phone number")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 1)
                        .frame(width: 75, height: 45)
                        .foregroundColor(.gray)
                        .overlay(
                        
                        )
                }
            }
        }
    }
}

#Preview {
    EnterPhoneNumberView()
}
