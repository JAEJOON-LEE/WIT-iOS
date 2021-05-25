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
        VStack{
            HStack(alignment: .center, spacing:10){
                Image(systemName:"magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:20)
                Text("\(content.owner.name)")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                Text("# \(content.desc)")
                    .font(.system(size: 18))
                    .foregroundColor(Color.gray)
                Spacer()
                
            }
            .padding(20)
            .shadow(color: Color.red, radius: 0, x:0, y:0)
        }
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 0)
        
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
