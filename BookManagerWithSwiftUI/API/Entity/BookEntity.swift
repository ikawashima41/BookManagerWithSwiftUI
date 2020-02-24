//
//  BookEntity.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

struct Book: Decodable {
    var id: Int
    var name: String
    var image: String?
    var price: Int
    var purchaseDate: String?

    enum CodingKeys: String, CodingKey {
        case purchaseDate = "purchase_date"
        case id
        case name
        case image
        case price
    }
}

struct BookListEntity<T: Decodable>: Decodable {
    var status: Int
    var result: [T]
}

struct BookEntity<T: Decodable>: Decodable {
    var status: Int
    var result: T
}
