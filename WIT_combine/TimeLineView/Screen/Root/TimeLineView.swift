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
    }
    
}
