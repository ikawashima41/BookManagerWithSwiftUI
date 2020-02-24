//
//  HomeViewModel.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject, Identifiable {

    private var limit: Int = 10

    private let client: AccountAPIClient
    private var cancellableSet: Set<AnyCancellable> = []

    @Published var rowData: [BookRowData] = []

    init(_ client: AccountAPIClient = AccountAPIClient()) {
        self.client = client
        self.featchBookList()
    }

    func featchBookList() {
        let client = BookAPIClient()
        limit += 10

        client.fetchBooks(params: BookListParams(page: 1, limit: limit))?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { (result) in
                self.rowData = result.result.map {
                    BookRowData(
                        id: $0.id,
                        title: $0.name,
                        price: "\($0.price)" ?? "",
                        purchaseDate: $0.purchaseDate ?? "",
                        image: $0.image ?? ""
                    )
                }
            })
            .store(in: &cancellableSet)
    }
}
