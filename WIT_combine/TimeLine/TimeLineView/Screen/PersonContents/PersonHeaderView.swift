//
//  PersonHeader.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/18.
//

import SwiftUI

struct PersonHeaderView: View {
    var person: Person
    
    var body: some View {
        HStack {
            Image(person.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:35)
                .padding(3)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(Color.blue,lineWidth: 1))
            VStack(alignment:.leading){
                Text(person.name)
                    .font(.system(size:15))
                    .fontWeight(.bold)
                    .padding(.bottom,0.1)
                    
                Text("# Look concept is Somthing")
                    .font(.system(size:12))
            }
            Spacer()
            
        }
    }
}

