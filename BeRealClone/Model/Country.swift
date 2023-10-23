//
//  Country.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 11/10/2023.
//

import Foundation

///Codeable is a typ alias for Encodable and Decodable protocols
///Codable is used in this file to encode JSON and to allow swift struct to hold finished data
public struct Country: Codable {
    public var phoneCode: String
    public let isoCode: String

    public init(phoneCode: String, isoCode: String) {
        self.phoneCode = phoneCode
        self.isoCode = isoCode
    }

    public init(isoCode: String) {
        self.isoCode = isoCode
        phoneCode = ""
        if let country = Country.allCountries.first(where: {$0.isoCode == isoCode}){
            self.phoneCode = country.phoneCode
    }
    }
    static let allCountries: [Country] = Bundle.main.decode(file: "countries.json")
}

public extension Country {
    /// Returns localized country name for localeIdentifier
    var localizedName: String {
        //The NSLocale.current property in the provided code snippet retrieves the locale (language and region) currently set on the device.
        //You typically use a locale to format and interpret information about and according to the user’s customs and preferences.
        //It constructs a locale identifier (id) by using the NSLocale class to map the ISO country code (provided as isoCode) to a locale identifier. For example, if isoCode is "US" (United States), this step maps it to a locale identifier like "en_US".

        //It then uses this locale identifier to retrieve the localized country name by calling displayName on the current locale. This function looks up the localized name for the specified identifier.
        //If a localized country name is found for the given isoCode, it returns the localized name. If no localized name is found, it returns the original isoCode.
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
        let name = NSLocale(localeIdentifier: NSLocale.current.identifier)
            .displayName(forKey: NSLocale.Key.identifier, value: id) ?? isoCode
        return name
    }
    /// the flag() function s designed to generate the flag emoji of a country based on its two-letter country code. The logic behind this function is based on Unicode scalar values.
    /// For the input "US":
    /// The Unicode scalar value for "U" is 85, and for "S" it's 83.
    /// After adding the base value of 127397, the new Unicode scalar values become 128692 for "U" and 128690 for "S".
    /// The function constructs a string with these Unicode scalars and returns the flag emoji: 🇺🇸
    /// - Parameter country: two-letter String
    /// - Returns: String type
    func flag(country: String) -> String {
        let base: UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}

extension Bundle {
    //T is a generic type parameter that conforms to the Decodable protocol. This means you can call the decode function with any type that conforms to Decodable, and the function will return an instance of that type.
    //if we use decode inside public struct Country above (in the case T will be Country struct), which conforms to the decodable protocol, the function will return to the type T (Country)

    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Can not find file named \(file) in the project")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Counld't load file named \(file) in the project")
        }
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Couldn't decode the file \(file) in the project")
            
        }
    return loadedData
    }
}
