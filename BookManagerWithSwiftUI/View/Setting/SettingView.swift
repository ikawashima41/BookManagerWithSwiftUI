//
//  SettingView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct SettingView: View {

    @State var enableLogut: Bool = false

    var body: some View {
        NavigationView {
            Button(action: {
                self.enableLogut.toggle()
            }) {
                Text("ログアウトします")
            }
            .navigationBarTitle("設定画面")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
