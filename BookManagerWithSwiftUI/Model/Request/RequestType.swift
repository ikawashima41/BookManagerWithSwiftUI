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
    case signIn
    case signUp
    case logout
    case fetchBooks
    case postBook
    case updateBook

    var path: String {
        switch self {
        case .signIn:
            return "signIn"
        default:
            return "signUp"
        }
    }

    var method: String {
        switch self {
        case .signIn:
            return "POST"
        case .signUp:
            return "POST"
        case .logout:
            return "DELETE"
        case .fetchBooks:
            return "GET"
        case .postBook:
            return "POST"
        case .updateBook:
            return "PATCH"
        }
    }
}

enum APIError: Error {
    case invalidResponse
    case serverErrorMessage(statusCode: Int)
    case urlError(URLError)
}
