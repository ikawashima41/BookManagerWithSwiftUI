//
//  SignUpView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State var mailAddress: String = ""
    @State var password: String = ""
    @State var confirmedPassword: String = ""
    @State var enableSignUp: Bool = false

    var body: some View {

        NavigationView {
            VStack {
                Text("メールアドレス")
                TextField("メールアドレスを入力して下さい", text: $mailAddress)
                    .textFieldStyle(
                        RoundedBorderTextFieldStyle()
                )
                Text("パスワード")
                TextField("パスワードを入力して下さい", text: $password)
                    .textFieldStyle(
                        RoundedBorderTextFieldStyle()
                )

                Text("パスワード確認")
                TextField("確認用パスワードを入力して下さい", text: $confirmedPassword)
                    .textFieldStyle(
                        RoundedBorderTextFieldStyle()
                )

                Button(action: {
                    self.enableSignUp.toggle()
                }) {
                    Text("新規登録します")
                }
            }
            .navigationBarTitle("新規登録画面")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
