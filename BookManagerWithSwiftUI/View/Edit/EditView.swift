//
//  EditView.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import SwiftUI

struct EditView: View {

    @ObservedObject var keyboard = KeyboardObserver()
    @State var image: UIImage?
    @State var showImagePicker: Bool = false
    @State var showDismissButton: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    if image == nil {
                        Rectangle()
                            .frame(width: 300, height: 200, alignment: .top)
                    } else {
                        Image(uiImage: image ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300, alignment: .top)
                            .clipped()
                    }
                    Button(action: {
                        self.showImagePicker = true
                    }) {
                        Text("画像選択")
                    }.sheet(isPresented: $showImagePicker) {
                        ImagePickerView(image: self.$image)
                    }
                }
                BookInfoView()
            }
        }.onAppear{
            self.keyboard.startObserve()
        }.onDisappear{
            self.keyboard.stopObserve()
        }.padding(.bottom, keyboard.keyboardHeight)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
