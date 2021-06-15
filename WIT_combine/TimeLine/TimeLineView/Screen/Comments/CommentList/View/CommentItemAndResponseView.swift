////
////  CommentItemAndResponseView.swift
////  WIT_combine
////
////  Created by LEESEUNGMIN on 2021/05/25.
////
//
import SwiftUI

struct CommentItemAndResponseView: View {
    @EnvironmentObject var store: Store
    var comment: Comment
    var colWidth: CGFloat
    @Binding var commentTxt: String

    var body: some View {
        LazyVStack(spacing:0) {
            CommentItemView(comment: comment, isReply: false, colWidth: colWidth-55 ,commentTxt:$commentTxt)
                .padding(.bottom,20)
            ForEach(comment.responses ?? []){ comment in
                CommentItemView(comment: comment, isReply: true, colWidth: colWidth-55,commentTxt:$commentTxt)
                    .padding(.bottom,20)

            }
        }
    }
}

