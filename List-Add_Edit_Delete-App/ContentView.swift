//
//  ContentView.swift
//  List-Add_Edit_Delete-App
//
//  Created by nakamura motoki on 2022/03/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var memo: String = ""
    
    @State private var showingAlert = false
    
    @State private var ideas: [String] = []
    
    var body: some View {
        VStack {
            TextEditor(text: $memo)
                .padding()
                .frame(width: 300, height: 100)
                .border(Color.gray, width: 1)
            HStack(spacing: 30){
                EditButton()
                Button {
                    // memoに文字が入力されてボタンを押したら
                    // memoを配列ideaに格納
                    // 何も入力されなかったら
                    // 「アイデアを入力してね！」のアラートを表示する
                    if memo.isEmpty {
                        showingAlert.toggle()
                        print("memo:\(memo)")
                    }else{
                        ideas.append("\(memo)")
                        print("memo:\(memo)")
                        memo = ""
                        print("memo:\(memo)")
                    }
                }label: {
                    // buttonの文字
                    Text("アイデア登録")
                }// Button
            }// HStak
            
            // List表示する
            List{
                ForEach(ideas, id: \.self) { ideas in
                    Text("\(ideas)")
                }// ForEach
                .onDelete { offsets in
                    self.ideas.remove(atOffsets: offsets)
                }
                .onMove { source, destination in
                    self.ideas.move(fromOffsets: source,
                                    toOffset: destination)
                }// .onMove
            }// List
        }// VStack
        .alert("アイデアを入力してね！", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {}
        }// .alert
    }// body
    
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

