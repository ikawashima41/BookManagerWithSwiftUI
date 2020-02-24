//
//  BookManagerWithSwiftUITests.swift
//  BookManagerWithSwiftUITests
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import XCTest
import Combine

@testable import BookManagerWithSwiftUI

class BookManagerWithSwiftUITests: XCTestCase {

    let client = BookAPIClient()
    var cancellableSet: Set<AnyCancellable> = []

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {

        let exp = expectation(description: "register book")

        client.registerBook(params: BookParams(id: 10, title: "Test", price: 1000, purchaseDate: "2020/01/01", image: ""))?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    XCTAssertFalse(false)
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { (result) in
                print(result)
                exp.fulfill()
            })
            .store(in: &cancellableSet)

            wait(for: [exp], timeout: 20.0)
    }

    func testFetchExample() {

        let exp = expectation(description: "fetch book")

        client.fetchBooks(params: BookListParams(page: 1, limit: 10))?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    XCTAssertFalse(false)
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { (result) in
                print(result)
                exp.fulfill()
            })
            .store(in: &cancellableSet)

            wait(for: [exp], timeout: 20.0)
    }
}
