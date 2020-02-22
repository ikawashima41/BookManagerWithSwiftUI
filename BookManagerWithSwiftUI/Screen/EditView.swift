//
//  EditView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct EditView: View {

    @State var purchaseDate: Date = Date()
    @State var title: String = ""
    @State var price: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("")
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }

                VStack {
                    Text("タイトル")
                    TextField("タイトルを入力して下さい", text: $title)
                        .textFieldStyle(
                            RoundedBorderTextFieldStyle()
                    )
                    Text("価格")
                    TextField("価格を入力して下さい", text: $price)
                        .textFieldStyle(
                            RoundedBorderTextFieldStyle()
                    )
                    Text("購入日")
                    DatePicker(selection: $purchaseDate, displayedComponents: [.date]) {
                        Text("購入日を選択して下さい")
                    }
                }
            }
            .navigationBarTitle("編集画面")
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
