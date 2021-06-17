//  PostCard.swift
//  WIT_combine
//
//  Created by ju young jeong on 2021/06/17.
//

import SwiftUI

struct PostCard: View {
    @ObservedObject var postCardService = PostCardService()
    
    @State private var likeAnimate = false
    @State private var bookmarkAnimate = false
    @State private var isBookmarked : Bool = false
    
    private let duration : Double = 0.3
    private var animationScale: CGFloat{
        postCardService.isLiked ? 1.2 : 1.2
    }
    
    init(post: PostModel){
        self.postCardService.post = post
        self.postCardService.hasLikedPost()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing : 10){
            HStack(spacing: 20){
                // Like Button
                Button(action: {
                    self.likeAnimate = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration,
                                                  execute: {
                                                    self.likeAnimate = false
                                                    
                                                    if(self.postCardService.isLiked){
                                                        self.postCardService.unlike()
                                                    } else {
                                                        self.postCardService.like()
                                                    }
                                                  })
                }){
                    Image(systemName: (self.postCardService.isLiked) ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .font(.system(size : 20))
                        .foregroundColor((self.postCardService.isLiked) ? .blue : .black)
                        .scaleEffect(likeAnimate ? animationScale : 1)
                        .animation(.easeIn(duration: duration))
                }
                // Bookmark Button
                Button {
                    isBookmarked.toggle()
                    likeAnimate.toggle()
                } label : {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .font(.system(size : 20))
                        .foregroundColor(isBookmarked ? .blue : .black)
                        .scaleEffect(bookmarkAnimate ? animationScale : 1)
                }
                Spacer()
            } // HStack
            .frame(height : 30)
            
            if(self.postCardService.post.likeCount > 0) {
                Text("\(self.postCardService.post.likeCount) likes")
                    .stylePrimary()
            }
            HStack{
                Text(self.postCardService.post.username)
                    .stylePrimary()
                Text(self.postCardService.post.caption)
                    .styleSecondary()
                Spacer()
            }
            
            NavigationLink(destination: CommentView(post: self.postCardService.post)){
                                Text("View Comments")
                                    .styleTertiary()
                                    .font(.caption)
                                }
//            MiniAddCommentView()
        }.padding(.horizontal, 10)
    } // body
}
