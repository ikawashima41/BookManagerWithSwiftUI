//
//  HomeView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @State var showAddView: Bool = false

    var bookRow: [BookRowData]

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: EditView()) {
                    BookRow(row: self.bookRow)
                }
            }
            .navigationBarTitle("ホーム画面")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showAddView.toggle()
                }) {
                    Text("書籍追加")
                }.sheet(isPresented: $showAddView) {
                    AddView()
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(bookRow: [])
    }
}

struct BookRowData: Identifiable {
    var id: Int
    var title: String
    var price: String
    var purchaseDate: String
    var image: String
}
