//
//  BeReal.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 23/10/2023.
//

import SwiftUI

struct BeReal: Decodable {
    var username: String
    var frontImageUrl: String
    var backImageUrl: String
    var userId: String
    var user: User?
}
