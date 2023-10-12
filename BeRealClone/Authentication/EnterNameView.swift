//
//  EnterNameView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 10/10/2023.
//

import SwiftUI

struct EnterNameView: View {
    @Binding var name: String
    @State var buttonActive = false
    @Binding var nameButtonClicked: Bool
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Text("BeReal.")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    VStack(alignment:. center, spacing: 8){
                        Text("Let's get started, what's your name")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                        Text(name.isEmpty ? "Your name" : "d")
                            .foregroundColor(name.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255): Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 210)
                            .overlay(
                                TextField("", text: $name)
                                //The multilineTextAlignment is used to set the alignment of the blueish thing when you click on the textfield
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 40, weight: .heavy))
                                    .foregroundColor(.white)
                            )
                    }.foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 50)
                VStack{
                    Spacer()
                    Button{
                        if buttonActive {
                            self.nameButtonClicked = true
                        }
                        
                    }label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: name){ newValue in
                            if !newValue.isEmpty{
                                buttonActive = true
                            }
                            else if newValue.isEmpty {
                                buttonActive = false
                            }
                        }
                    }
                  
                }
            }
        }
    }
}

//#Preview {
//    EnterNameView()
//}
