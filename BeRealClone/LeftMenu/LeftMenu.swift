//
//  LeftMenu.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 07/10/2023.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                LeftMenuTopView()
          RequestsView()
            }
        }
    }
}

#Preview {
    LeftMenu()
}

