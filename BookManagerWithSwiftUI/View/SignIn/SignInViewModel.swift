//
//  SignInViewModel.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject, Identifiable {

    private let client: AccountAPIClient
    private var cancellableSet: Set<AnyCancellable> = []

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var enableSignIn: Bool = false

    init(_ client: AccountAPIClient = AccountAPIClient()) {
        self.client = client

        Publishers.CombineLatest($email, $password)
            .receive(on: RunLoop.main)
            .map { (email, password) in
                return !email.isEmpty && password.count > 6
            }
            .assign(to: \.enableSignIn, on: self)
            .store(in: &cancellableSet)
    }

    func signIn() {
        client.signIn(params: AuthParams(email: email, password: password))?
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
