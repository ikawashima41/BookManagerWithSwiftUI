//
//  SettingViewModel.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

final class SettingViewModel {

    private var cancellableSet: Set<AnyCancellable> = []
    private let client: AccountAPIClient

    init(_ client: AccountAPIClient = AccountAPIClient()) {
        self.client = client
    }

    func logout() {
        client.signOut()?
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("Finished")
            }
        }, receiveValue: { response in
            AppUserDefaults.setSessionToken(token: "")
        })
        .store(in: &cancellableSet)
    }
}
