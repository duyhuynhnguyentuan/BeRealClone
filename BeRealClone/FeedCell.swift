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
                ZStack{
                    VStack{
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                        
                    }
                    VStack{
                        HStack{
                            
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
            
        }
    }
}

#Preview {
    FeedCell()
}
