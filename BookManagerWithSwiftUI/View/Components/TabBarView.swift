//
//  TabBarView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView(bookRow: [])
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ホーム")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("設定")
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        return TabBarView()
    }
}
