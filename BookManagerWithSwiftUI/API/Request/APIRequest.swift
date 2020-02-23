//
//  RequestBuilder.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

final class APIRequest {

    func build(_ type: RequestType, session: URLSession = URLSession.shared) throws ->  URLSession.DataTaskPublisher {

        /// TODO: - Replace base url
        let baseUrl: String = AppResource.baseUrl + type.path
        guard var components = URLComponents(string: baseUrl) else {
            throw APIError.invalidResponse
        }
        components.queryItems = type.params

        guard let url = components.url else {
            throw APIError.invalidResponse
        }

        var request = URLRequest(url: url)
        request.httpMethod = type.method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        switch type {
        case .signUp:
            break

        default:
            request.addValue(AppUserDefaults.getSessionToken(), forHTTPHeaderField: "Authorization")

        }

        return session.dataTaskPublisher(for: request)
    }

    func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.serverErrorMessage(statusCode: httpResponse.statusCode)
        }
        return data
    }
}
