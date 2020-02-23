//
//  AccountDataStore.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

struct AccountAPIClient {
    private let request: APIRequest = .init()

    func signIn(params: AuthParams) -> AnyPublisher<AuthEntity, Error>? {
        return try? request.build(.signIn(params))
            .tryMap { try self.request.validate($0.data, $0.response) }
            .decode(type: AuthEntity.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func signUp(params: AuthParams) -> AnyPublisher<AuthEntity, Error>? {
        return try? request.build(.signUp(params))
            .tryMap { try self.request.validate($0.data, $0.response) }
            .decode(type: AuthEntity.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func signOut() -> AnyPublisher<AuthEntity, Error>? {
        return try? request.build(.signOut)
            .tryMap { try self.request.validate($0.data, $0.response) }
            .decode(type: AuthEntity.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
