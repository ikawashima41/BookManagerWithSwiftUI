//
//  BookCell.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct BookRow: View {

    var row: [BookRowData]

    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "house.fill")
                Divider()
                VStack(alignment: .leading) {
                    Text("タイトル")
                    HStack {
                        Text("価格")
                        Text("購入日")
                    }
                }
            }
        }.padding()
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(row: [])
    }
}
