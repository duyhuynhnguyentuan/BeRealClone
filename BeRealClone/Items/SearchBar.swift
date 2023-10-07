//
//  SearchBar.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 07/10/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack{
            TextField("", text: $text)
                .padding(8)
                .frame(height: 50)
                .padding(.horizontal,24)
                .foregroundColor(.white)
                .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 25, alignment: .leading)
                        Text(text.isEmpty ? "Add or search friends" : "")
                            .foregroundColor(.gray)
                            .padding(.leading, -4)
                        Spacer()
                    }
                        .padding(.leading, 4)
                )
            if isEditing {
                Button{
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.endEditing()
                }label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
                
            }
        }.onTapGesture {
            self.isEditing = true
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), isEditing: .constant(true))
}
