//
//  Request.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

enum RequestType {
    case signIn(AuthParams)
    case signUp(AuthParams)
    case signOut
    case fetchBooks(BookListParams)
    case registerBook(BookParams)
    case updateBook(BookParams)

    var path: String {
        switch self {
        case .signIn:
            return "/login"
        case .signUp:
            return "/sign_up"
        case .signOut:
            return "/logout"
        case .fetchBooks, .registerBook:
            return "/books"
        case .updateBook(let params):
            return "/books/\(params.id)"
        }
    }

    var method: String {
        switch self {
        case .signIn, .signUp, .registerBook:
            return "POST"

        case .signOut:
            return "DELETE"

        case .fetchBooks:
            return "GET"

        case .updateBook:
            return "PUT"
        }
    }

    var params: [URLQueryItem] {
        switch self {
        case .signIn(let params), .signUp(let params):
            return
                [URLQueryItem(name: "email", value: params.email),
                 URLQueryItem(name: "password", value: params.password)]

        case .fetchBooks(let params):
            return
                [URLQueryItem(name: "page", value: "\(params.page)"),
                 URLQueryItem(name: "limit", value: "\(params.limit)")]

        case .registerBook(let params), .updateBook(let params):
            return
                [URLQueryItem(name: "title", value: params.title),
                 URLQueryItem(name: "price", value: "\(params.price)"),
                 URLQueryItem(name: "purchase_date", value: params.purchaseDate),
                 URLQueryItem(name: "image", value: params.image)]

        default:
            return []
        }
    }
}

enum APIError: Error {
    case invalidResponse
    case serverErrorMessage(statusCode: Int)
    case urlError(URLError)
}

struct BookListParams {
    var page: Int
    var limit: Int
}

struct BookParams {
    var id: String?
    var title: String
    var price: Int
    var purchaseDate: String
    var image: String
}

struct AuthParams {
    var email: String
    var password: String
}
