//
//  SignInView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct SignInView: View {

    @State var mailAddress: String = ""
    @State var password: String = ""
    @State var enableSignIn: Bool = false

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

                Button(action: {
                    self.enableSignIn.toggle()
                }) {
                    Text("ログイン")
                }
            }
            .navigationBarTitle("ログイン画面")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
