//  PostCard.swift
//  WIT_combine
//
//  Created by ju young jeong on 2021/06/17.
//

import SwiftUI

struct PostCard: View {
    @ObservedObject var postCardService = PostCardService()
    
    @State private var animate = false
    private let duration : Double = 0.3
    private var animationScale: CGFloat{
        postCardService.isLiked ? 1.2 : 1.2
    }
    
    init(post: PostModel){
        self.postCardService.post = post
        self.postCardService.hasLikedPost()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 0){
                
                Button(action: {
                    self.animate = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration,
                                                  execute: {
                                                    self.animate = false
                                                    
                                                    if(self.postCardService.isLiked){
                                                        self.postCardService.unlike()
                                                    } else {
                                                        self.postCardService.like()
                                                    }
                                                  })
                }){
                    
                    Image(systemName: (self.postCardService.isLiked) ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 23)
                        .foregroundColor((self.postCardService.isLiked) ? .blue : .black)
                        .padding().scaleEffect(animate ? animationScale : 1)
                        .animation(.easeIn(duration: duration))
                        
                    
                }
                Image(systemName: "bookmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15)
                    .padding(.leading,15)
                
                Spacer()
                if(self.postCardService.post.likeCount > 0) {
                    Text("\(self.postCardService.post.likeCount) likes")
                        .stylePrimary()
                        .padding(.trailing,5)
                }
                
            }.padding(.bottom,5)

            HStack{
                HStack{
                    Text(self.postCardService.post.username)
                        .stylePrimary()
                    Text(self.postCardService.post.caption)
                        .styleSecondary()
                }
                .padding(.bottom,5)
                Spacer()
            }
            HStack{
                Text("View Comments")
                    .styleTertiary()
                    .font(.caption)
                    .padding(.leading)
                Spacer()
            }
            MiniAddCommentView()
                
        }
    }
}
