//
//  CommentsBodyView.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/05/25.
//

import SwiftUI

struct CommentsBodyView: View {
    @StateObject var vm: CommentsBodyViewModel = CommentsBodyViewModel()
    var colWidth: CGFloat
    let placeholder = "Add a comment"
    @State var commentTxt: String = ""
    
    func emojiButton(_ emoji: String) -> Button<Text> {
        Button{
            self.commentTxt += emoji
        } label: {
            Text(emoji)
        }
    }

    var body: some View {
        ScrollView {
            ForEach(vm.allComments){ comment in
                CommentItemAndResponseView(comment: comment,colWidth:colWidth,commentTxt:$commentTxt)
            }
        }
        HStack(spacing:5){
            TextField(placeholder, text: $commentTxt)
                .frame(width: colWidth-90, height: 50, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray,lineWidth: 0.1))
                .padding(.leading,20)
            emojiButton("💜")
                .frame(width: 25)
                .padding(.trailing,2)
            Button {
                self.commentTxt = ""
            
            } label : {
                Image(systemName: "plus.circle")
                    .frame(width: 28)
                    .padding(.leading,0)
            }
    }
        .frame(width: colWidth, height: 50, alignment: .leading)
        .padding(.trailing,10)
    }
}

