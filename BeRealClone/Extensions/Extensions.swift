//
//  Extensions.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/10/2023.
//

import SwiftUI

extension View {
    func placeholder<Content:View>(
                                   when shouldShow: Bool,
                                   alignment: Alignment = .leading,
                                   @ViewBuilder placeholder: () -> Content) -> some View {
                                       ZStack(alignment: alignment){
                                           placeholder().opacity(shouldShow ? 1 : 0)
                                           self
                                       }
    }
    
}
