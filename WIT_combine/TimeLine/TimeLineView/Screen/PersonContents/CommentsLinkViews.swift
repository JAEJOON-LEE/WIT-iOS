//
//  CommentsLinkViews.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/24.
//

import SwiftUI

struct CommentsLinkViews: View {
    
    var comments: [Comment]?
    var content: UserContent
    var colWidth: CGFloat
    @State var tag:Int? = nil
    @State var currentComments: [Comment]? = nil
    
    var body: some View {
        ZStack{
            NavigationLink(destination: CommentsView(comments: self.$currentComments , contentOwner: self.content.owner,colWidth:colWidth*3, content:self.content), tag: 1, selection: self.$tag ) {
                 EmptyView()
               }
        }
        if let comments = self.comments, comments.count > 0 {
            VStack(alignment: .leading) {
                Button( action : {
                        self.tag = 1
                        self.currentComments = comments
                      }) {
                        Text("View all \(comments.count) comments")
                            .styleTertiary()
                            .padding(.bottom,3)
                    }
                
            }
        }
    }
}


