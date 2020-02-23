//
//  AccountInfoView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

enum ScreenType {
    case signIn
    case signUp
    case none
}

/// MARK: - Use this custom View if needed
struct AccountInfoView: View {
    @State var mailAddress: String = ""
    @State var password: String = ""
    @State var confirmedPassword: String = ""

    var screenType: ScreenType = .none

    init(type: ScreenType) {
        self.screenType = type
    }

    var body: some View {
        VStack(alignment: .leading) {
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

            if screenType == .signUp {
                Text("パスワード確認")
                TextField("確認用パスワードを入力して下さい", text: $confirmedPassword)
                    .textFieldStyle(
                            RoundedBorderTextFieldStyle()
                )
            }
        }.padding()
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView(type: .signIn)
    }
}
