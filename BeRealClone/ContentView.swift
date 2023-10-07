//
//  ContentView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 01/10/2023.
//

import SwiftUI

struct ContentView: View {
    //the below init() is an alternative for hidden the scroll content background which is available on io 16 and later versions.
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
       Feed()
    }
}

#Preview {
    ContentView()
}
