//
//  CommentsView.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/05/25.
//

import SwiftUI

struct CommentsView: View {

    @Binding var comments: [Comment]?
    var contentOwner: Person
    var colWidth: CGFloat
    var content: UserContent
    var body: some View{
        Form{
            Section(header: Text("\(content.owner.name)").foregroundColor(.black)){
                VStack{
                    HStack(spacing:7){
//                        Image(systemName:"magnifyingglass")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width:16)
//                        Text("\(content.owner.name)")
//                            .fontWeight(.bold)
//                            .font(.system(size: 16))
//                            .foregroundColor(Color.black)
                        Text("# \(content.desc)")
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                        Spacer()
                        Text("\(content.likeCount) likes")
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                        
                    }
//                    .padding(10)
//                    .shadow(color: Color.red, radius: 0, x:0, y:0)
                }
//                .background(Color.white)
//                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 0)
                HStack{
                    Spacer()
                    Image(content.image)
                        .resizable()
    //                    .aspectRatio(contentMode: .fit)
                        .frame(width: colWidth/1.4, height: colWidth/1.7)
                    Spacer()

                }
            }
        }
                Divider()
                VStack {
                    CommentsBodyView(colWidth:colWidth)
                }
                .navigationBarTitle("Comments",displayMode: .inline)
                .navigationBarItems(
                    trailing: Image(systemName:"text.bubble")
                )
                .padding(.leading,5)
                .padding(.trailing,5)

        
        
    }

}


//struct CommentsView: View {
//    @Binding var comments: [Comment]?
//    var contentOwner: Person
//    var body: some View {
//        Text(contentOwner.name)
//        if let comments = self.comments, comments.count > 0 {
//            ForEach(comments) { comment in
//                HStack {
//                    Image(comment.owner?.name ?? "")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:25)
//                        .padding(3)
//                        .clipShape(Circle())
//                        .overlay(Circle()
//                                    .stroke(Color.blue,lineWidth: 1))
//                    Text(comment.owner?.name ?? "")
//                        .stylePrimary()
//                    Text(comment.text)
//                        .styleSecondary()
//                }
//
//            }
//        }
//
//    }
//}
