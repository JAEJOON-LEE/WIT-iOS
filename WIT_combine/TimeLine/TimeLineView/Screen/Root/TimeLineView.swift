//
//  TimeLineView.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/23.
//

import SwiftUI

struct TimeLineView: View {
    
    var colWidth : CGFloat
    @State var tag:Int? = nil
    var body: some View {
        ZStack(alignment : .bottomTrailing) {
            NavigationLink(destination: PostView().navigationBarTitle(Text("New Post"), displayMode: .inline), tag: 1, selection: self.$tag ) {
                 EmptyView()
               }
            VStack{
                //navigation field
                ScrollView{
                    VStack{
                        NewsView()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .padding(.bottom,15)
                        PersonBodyView(colWidth:colWidth)
                            .padding(.leading,5)
                            .padding(.trailing,5)
                            .padding(.bottom,10)
                        
                    }
                }
            }
            Button {
                self.tag = 1
            } label : {
                Image(systemName: "plus")
                    .frame(width: 30, height: 30)
                    .font(.system(size : 45))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.secondary)
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
    
}
