//
//  SignInView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct SignInView: View {

    @State var showSignUpView: Bool = false
    @State var showHomeView: Bool = false

    @ObservedObject var viewModel = SignInViewModel()

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("メールアドレス")
                    TextField("メールアドレスを入力して下さい", text: $viewModel.email)
                        .textFieldStyle(
                            RoundedBorderTextFieldStyle()
                    )
                    Text("パスワード")
                    TextField("パスワードを入力して下さい", text: $viewModel.password)
                        .textFieldStyle(
                            RoundedBorderTextFieldStyle()
                    )
                    if viewModel.enableSignIn {
                        Button(action: {
                            self.showHomeView.toggle()
                            self.viewModel.signIn()
                        }) {
                            Text("ログイン")
                        }.sheet(isPresented: $showHomeView) {
                            TabBarView()
                        }
                    }
                }.padding()
                .navigationBarTitle("ログイン画面")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showSignUpView.toggle()
                    }) {
                        Text("新規登録")
                    }.sheet(isPresented: $showSignUpView) {
                        SignUpView()
                    }
                )
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
