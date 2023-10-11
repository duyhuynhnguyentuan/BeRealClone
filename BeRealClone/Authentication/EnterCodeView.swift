//
//  EnterCodeView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 11/10/2023.
//

import SwiftUI
//Combine is used for Just()
import Combine

struct EnterCodeView: View {
    @State var otpCode = ""
    @State var buttonActive = false
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
                    VStack{
                        VStack(alignment: .center, spacing: 8){
                            Text("Enter the code we sent to +84 835488888")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                            Text("......")
                                .foregroundColor(otpCode.isEmpty ? .gray : .black)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 70))
                                .padding(.top, -40)
                                .overlay(
                                    TextField("", text: $otpCode)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 24, weight: .heavy))
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(otpCode), perform: { _ in
                                            limitText(6)
                                        })
                                        .onReceive(Just(otpCode), perform: { newValue in
                                            let filtered = newValue.filter({
                                                Set("0123456789").contains($0)}
                                            )
                                            if filtered != newValue {
                                                otpCode = filtered
                                            }
                                        })
                                )
                            
                        }
                        .padding(.top, 50)
                        Spacer()
                    }
                    VStack{
                        Text("Change the phone number")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                        Button{
                            
                        }label: {
                            WhiteButtonView(buttonActive: $buttonActive, text: otpCode.count == 6 ? "Continue" : "Resend in ")
                        }.disabled(buttonActive ? false : true)
                            .onChange(of: otpCode){ newValue in
                                if !newValue.isEmpty {
                                    buttonActive = true
                                }
                                else if newValue.isEmpty {
                                    buttonActive = false
                                }
                            }
                    }
                }
            }
            .onReceive(timer) { time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                else{
                    buttonActive = true
                }
            }
        }
    }
    func limitText(_ upper: Int){
        if otpCode.count > upper {
            otpCode = String(otpCode.prefix(upper))
        }
    }
}

#Preview {
    EnterCodeView()
}
