//
//  HomeView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct HomeView: View {


    var body: some View {
        NavigationView {
            HStack {
                Image("")
                VStack {
                    Text("タイトル")
                    HStack {
                        Text("価格")
                        Text("購入日")
                    }
                }
            }
            .navigationBarTitle("Home画面")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct BookViewData {
    var title: String
    var price: String
    var purchaseDate: String
    var image: String
}
