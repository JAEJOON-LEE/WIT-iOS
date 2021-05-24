//
//  FooterActionBarView.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/21.
//

import SwiftUI

struct FooterActionBarView: View {
    var colWidth: CGFloat
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(colWidth),alignment: .leading),
            GridItem(.fixed(colWidth),alignment:.trailing),
            GridItem(.fixed(colWidth)),
        ]){
                HStack{
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:23)
                        .padding(.trailing,15)
                    Image(systemName: "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                        .padding(.trailing,0)

                }
                
            }
            .padding(.trailing,30)
    }
}


