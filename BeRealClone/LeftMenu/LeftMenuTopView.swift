//
//  LeftMenuTopView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 07/10/2023.
//

import SwiftUI

struct LeftMenuTopView: View {
    @State var text = ""
    @State var isEditing = false
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Spacer()
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                }
                Text("BeReal.")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
            }
            SearchBar(text: $text, isEditing: $isEditing)
            Spacer()
        }
    }
}

#Preview {
    LeftMenuTopView()
}
