//
//  CommentsItemView.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/05/25.
//

import SwiftUI

struct CommentItemView: View {
    var comment: Comment
    var isReply: Bool = false
    var colWidth: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing:10){
            if isReply == true {
                Spacer()
                    .frame(width: colWidth * 0.45/10)
            }
            HStack {
                Image(comment.owner.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isReply==false ? 30: 20)
                    .padding(3)
                    .clipShape(Circle())
                    .overlay(Circle()
                    .stroke(Color.blue,lineWidth: 2))
            }
//            .frame(width: isReply == false ? colWidth * 2/10 : colWidth * 1.8/10, alignment: .topLeading)
            TextLikeView(comment:comment , colWidth: colWidth, isReply: isReply)
            
        }
    }
}

struct  TextLikeView: View {
    var comment: Comment
    var colWidth: CGFloat
    var isReply: Bool
    private var textWidth: CGFloat = 0
    
    init(comment: Comment, colWidth: CGFloat, isReply: Bool){
        self.comment = comment
        self.colWidth = colWidth
        self.isReply = isReply
        self.textWidth = isReply == false ? colWidth * 7/10 : colWidth * 5.6/10
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 0){
                Group {
                    Text("\(comment.owner.name) ")
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                    + Text("\(comment.text) ")
                        .font(.system(size: 13))
                }
                .frame(width: textWidth, alignment: .topLeading)
                VStack {
                    Image(systemName: "suit.heart")
                        .frame(width:10)
                }
                .frame(width: isReply == false ? colWidth * 2/10 : colWidth * 3/10 ,alignment:.trailing)
                
                
            }
            
            HStack(spacing: 20) {
                Text("14h")
                    .styleTertiary()
                if comment.likeCount > 0 {
                    Text("\(comment.likeCount) likes")
                        .styleSecondary()
                }
                
                Button {
                    
                } label: {
                    Text("Reply")
                        .styleTertiary()
                }
            }
            
            
        }
    }
}
