//
//  HomeView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {

    @State var showAddView: Bool = false
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.rowData) { row in
                    NavigationLink(destination:
                        EditView()
                    ) {
                        BookRow(row: row)
                    }
                }
            }
            .onAppear(perform: {
                self.viewModel.featchBookList()
            })
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
        HomeView(viewModel: HomeViewModel())
    }
}
