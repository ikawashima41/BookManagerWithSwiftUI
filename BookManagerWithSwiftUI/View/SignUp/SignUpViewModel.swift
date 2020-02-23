//
//  SignUpViewModel.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject, Identifiable {

    private let client: AccountAPIClient
    private var cancellableSet: Set<AnyCancellable> = []

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    @Published var enableSignUp: Bool = false

    init(_ client: AccountAPIClient = AccountAPIClient()) {
        self.client = client

        Publishers.CombineLatest($email, $password)
            .receive(on: RunLoop.main)
            .map { (email, password) in
                return !email.isEmpty && password.count > 6
            }
            .assign(to: \.enableSignUp, on: self)
            .store(in: &cancellableSet)
    }

    func signUp() {
        client.signUp(params: AuthParams(email: email, password: password))?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { response in
                AppUserDefaults.setSessionToken(token: response.result?.token ?? "")
            })
            .store(in: &cancellableSet)
    }
}
