//
//  EditViewModel.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

final class EditViewModel: ObservableObject, Identifiable {
    private let client: AccountAPIClient
    private var cancellableSet: Set<AnyCancellable> = []

    init(_ client: AccountAPIClient = AccountAPIClient()) {
        self.client = client
    }

    func registerBook() {
        let client = BookAPIClient()

        client.updateBook(params: BookParams(id: 10, title: "", price: 1000, purchaseDate: "", image: ""))?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { (result) in
                print(result)
            })
            .store(in: &cancellableSet)
    }
}
