//
//  TimeLineView.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/23.
//

import SwiftUI

struct TimeLineView: View {
    
    var colWidth : CGFloat
    
    var body: some View {
        ZStack(alignment : .bottomTrailing) {
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
            } label : {
                Image(systemName: "rectangle.3.offgrid.fill")
                    .font(.system(size : 30))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                    .padding(15)
                    .padding(.bottom,40)
            }
        }
    }
    
}
