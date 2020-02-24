//
//  SignUpView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showHomeView: Bool = false
    @State var showDismissButton: Bool = false
    
    @ObservedObject var viewModel = SignUpViewModel()

    var body: some View {

        NavigationView {
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

                Text("パスワード確認")
                TextField("確認用パスワードを入力して下さい", text: $viewModel.confirmedPassword)
                    .textFieldStyle(
                        RoundedBorderTextFieldStyle()
                )

                if viewModel.enableSignUp {
                    Button(action: {
                        self.showHomeView.toggle()
                        self.viewModel.signUp()
                    }) {
                        Text("新規登録")
                    }.sheet(isPresented: $showHomeView) {
                        TabBarView()
                    }
                }
            }.padding()
                .navigationBarTitle("新規登録画面")
                .navigationBarItems(leading:
                    Button(action: {
                        self.showDismissButton = true
                    }) {
                        Text("戻る")
                    }.sheet(isPresented: $showDismissButton) {
                        SignInView()
                    }
            )
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
