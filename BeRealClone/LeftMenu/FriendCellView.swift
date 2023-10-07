//
//  FriendCellView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 07/10/2023.
//

import SwiftUI

struct FriendCellView: View {
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
            }
         Spacer()
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

#Preview {
    FriendCellView()
}
