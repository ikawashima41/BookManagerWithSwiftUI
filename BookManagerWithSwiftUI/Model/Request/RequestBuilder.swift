//
//  RequestBuilder.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation

final class Request {

    func build(_ type: RequestType, query: String) throws -> URLRequest {

        let baseUrl = "https://api.github.com/search/repositories" + type.path
        guard var components = URLComponents(string: baseUrl) else {
            throw APIError.invalidResponse
        }
        components.queryItems = [URLQueryItem(name: "q", value: query)]

        guard let url = components.url else {
            throw APIError.invalidResponse
        }

        var request = URLRequest(url: url)
        request.httpMethod = type.method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }

    func fetch(_ type: RequestType, query: String, session: URLSession = URLSession.shared)throws -> URLSession.DataTaskPublisher {
        let request = try build(type, query: query)
        return session.dataTaskPublisher(for: request)
    }
}
