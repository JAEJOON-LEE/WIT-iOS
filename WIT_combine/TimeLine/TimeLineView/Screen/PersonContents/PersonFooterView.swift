//
//  PersonFooterView.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/21.
//

import SwiftUI

struct PersonFooterView: View {
    var content: UserContent?
    var colWidth: CGFloat
    
    var body: some View {
        if let content = content {
            VStack(alignment:.leading){
                FooterActionBarView(colWidth: colWidth)
                    .padding(.bottom,10)
                Text("\(content.likeCount) Likes")
                    .stylePrimary()
                    .padding(.bottom,5)
                HStack{
                    HStack{
                        Text(content.owner.name)
                            .stylePrimary()
                        Text(content.desc)
                            .styleSecondary()
                    }
                    .padding(.bottom,5)
                    Spacer()
                }
                CommentsLinkViews(comments: content.comments , content: content, colWidth:colWidth)
                MiniAddCommentView(person:content.owner)
            }
        }
            
    }
}


