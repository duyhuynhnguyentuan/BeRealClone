//
//  SuggestionCellView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 07/10/2023.
//

import SwiftUI

struct SuggestionCellView: View {
    var body: some View {
        HStack{
            Image("dudu")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .cornerRadius(65/2)
            VStack(alignment: .leading){
                Text("Matcha Huynh")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text("matchacha")
                    .foregroundColor(.gray)
                HStack{
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    Text("Matcha")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .padding(.leading, -4)
                }
            }
        Spacer()
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                .frame(width: 45, height: 25)
                .overlay(
                Text("ADD")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                )
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SuggestionCellView()
}
