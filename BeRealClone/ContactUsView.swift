//
//  ContactUsView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 09/10/2023.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("How can we help you?")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                        }
                    }
                Spacer()
                }
                VStack{
                    VStack(spacing: 28){
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            HStack{
                                Image(systemName: "questionmark.circle")
                                Text("Ask a question")
                                    
                            }
                            .foregroundStyle(.white)
                        }
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            HStack{
                                Image(systemName: "ladybug")
                                Text("Report a problem")
                                    
                            }
                            .foregroundStyle(.white)
                        }
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            HStack{
                                Image(systemName: "atom")
                                Text("Become Beta Tester")
                                    
                            }
                            .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 80)
            }
        }
    }
}

#Preview {
    ContactUsView()
}
