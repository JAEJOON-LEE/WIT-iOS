//
//  CommentsLinkViews.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/24.
//

import SwiftUI

struct CommentsLinkViews: View {
    
    var comments: [Comment]?
    
    var body: some View {
        if let comments = self.comments, comments.count > 0 {
            VStack(alignment: .leading) {
                Text("View all \(comments.count) comments")
                    .styleTertiary()
                    .padding(.bottom,3)
                ForEach(comments) { comment in
                    HStack {
                        Text(comment.owner?.name ?? "")
                            .stylePrimary()
                        Text(comment.text)
                            .styleSecondary()
                    }
                    
                }
                
            }
        }
    }
}

struct CommentsLinkViews_Previews: PreviewProvider {
    static var previews: some View {
        CommentsLinkViews()
    }
}
