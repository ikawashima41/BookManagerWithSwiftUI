//
//  UserEntity.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

struct Account: Decodable {
    var id: Int
    var email: String
    var token: String
}

struct AuthEntity: Decodable {
    var status: Int
    var result: Account?
}
