//
//  ContentView.swift
//  gomiApp-1207
//
//  Created by 近藤米功 on 2022/12/07.
//

import SwiftUI

struct ContentView: View {
    @State var categorys = [Category(name: "買い物リスト"),Category(name: "旅行")]

    @State var isShowInputView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(categorys) { category in
                    NavigationLink(value: category.id) {
                        Text(category.name)
                    }
                }
            }.navigationTitle("カテゴリ名")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isShowInputView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .fullScreenCover(isPresented: $isShowInputView) {
                    InputView(isShowInputView: $isShowInputView, categorys: $categorys)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
