//
//  SelectCountryView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 11/10/2023.
//

import SwiftUI

struct SelectCountryView: View {
    var countries: [Country] = Country.allCountries
    @Binding var chosenCountry: Country
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("Select Country")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        HStack{
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
               
                VStack{
                    VStack{
                        List{
                            Section{
                                ForEach(countries, id: \.isoCode) { country in
                                    HStack{
                                        Text("\(country.flag(country: country.isoCode)) \(country.localizedName) (+\(country.phoneCode))")
                                        Spacer()
                                        if country.isoCode == chosenCountry.isoCode{
                                            Image(systemName: "checkmark.circle")
                                        }
                                    }
                                    .onTapGesture {
                                        chosenCountry = country
                                        dismiss()
                                    }
                                    
                                }
                            } header: {
                                Text("SUGGESTED")
                                    .padding(.leading, -8)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }
                .padding(.top, 50)
            }
            .environment(\.colorScheme, .dark)
        }
    }
}

//#Preview {
//    SelectCountryView()
//}
