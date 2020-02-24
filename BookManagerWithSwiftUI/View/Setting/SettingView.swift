//
//  SettingView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI
import Combine

struct SettingView: View {

    @State var enableSignOut: Bool = false
    @ObservedObject var viewModel = SettingViewModel()

    var body: some View {
        NavigationView {
            Button(action: {
                self.enableSignOut.toggle()
                self.viewModel.logout()
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
