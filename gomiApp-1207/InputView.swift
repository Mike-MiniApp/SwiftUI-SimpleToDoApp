//
//  InputView.swift
//  gomiApp-1207
//
//  Created by 近藤米功 on 2022/12/07.
//

import SwiftUI

struct InputView: View {
    @Binding var isShowInputView: Bool
    @Binding var categorys: [Category]
    @State var text = ""

    var body: some View {
        NavigationStack {
            HStack {
                Text("名前")
                    .padding()
                TextField("カテゴリ名を入力", text: $text)
                    .textFieldStyle(.roundedBorder)
            }.padding()
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            categorys.append(Category(name: text))
                            isShowInputView = false
                        } label: {
                            Text("追加")
                        }.disabled(text.isEmpty)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isShowInputView = false
                        } label: {
                            Text("キャンセル")
                        }

                    }
                }
        }
    }
}

struct Preview_wrapper: View {
    @State var isShowInputView = false
    @State var categorys = [Category(name: "ダミー")]
    var body: some View {
       InputView(isShowInputView: $isShowInputView, categorys: $categorys)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
       Preview_wrapper()
    }
}
