//
//  MemoryView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 04/10/2023.
//

import SwiftUI

struct MemoryView: View {
    var day: Int
    var body: some View {
        VStack{
            ZStack{
                Text("\(day)")
                    .foregroundColor(.white)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 8, height: 70)
                    .cornerRadius(6)
                    .overlay(
                     RoundedRectangle(cornerRadius: 6)
                        .stroke(.white, lineWidth: 1.5)
                        .frame(width: UIScreen.main.bounds.width / 8, height: 70)

                    )
            }
        }
    }
}

#Preview {
    MemoryView(day: 12)
}
