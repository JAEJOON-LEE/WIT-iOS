//
//  miniAddCommentView.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/21.
//

import SwiftUI

struct MiniAddCommentView: View {
    
    var person: Person
    @StateObject var vm: MiniAddCommentViewModel = MiniAddCommentViewModel()
    let placeholder = "Add a comment"
    
    func emojiButton(_ emoji: String) -> Button<Text> {
        Button{
            self.vm.commentTxt += emoji
        } label: {
            Text(emoji)
        }
    }
    var body: some View {
        ZStack{
            HStack(spacing:10){
                TextField(placeholder, text: $vm.commentTxt)
                    .frame(height:25)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray,lineWidth: 0.1))
                emojiButton("💜")
                Button {
                    self.vm.commentTxt = ""
                
                } label : {
                    Image(systemName: "plus.circle")
                        .frame(width: 20)
                        .padding(.trailing,35)
                }
        }
            .padding(.leading,5)
        }
    }
}

