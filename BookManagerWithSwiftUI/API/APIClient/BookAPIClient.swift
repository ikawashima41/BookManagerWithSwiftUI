//
//  BookDataStore.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

struct BookAPIClient {
    private let request: APIRequest = .init()

    func fetchBooks(params: BookListParams) -> AnyPublisher<BookListEntity<Book>, Error>? {
        return try? request.build(.fetchBooks(params))
            .tryMap { try self.request.validate($0.data, $0.response) }
            .decode(type: BookListEntity<Book>.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func registerBook(params: BookParams) -> AnyPublisher<BookEntity, Error>? {
        return try? request.build(.registerBook(params))
            .tryMap { try self.request.validate($0.data, $0.response) }
            .decode(type: BookEntity.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func updateBook(params: BookParams) -> AnyPublisher<BookEntity, Error>? {
        return try? request.build(.updateBook(params))
            .tryMap { try self.request.validate($0.data, $0.response) }
            .decode(type: BookEntity.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
