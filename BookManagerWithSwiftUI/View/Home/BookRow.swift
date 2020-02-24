//
//  BookCell.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct BookRow: View {

    var row: BookRowData

    var body: some View {
        HStack {
            Image(systemName: "star.fill")
            Spacer()
                .frame(width: 100)
            VStack(alignment: .leading) {
                Text(row.title)
                HStack {
                    Text(row.price)
                    Text(row.purchaseDate)
                }
            }
        }.padding()
    }
}
