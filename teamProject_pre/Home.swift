//
//  Home.swift
//  teamProject_pre
//
//  Created by 이재준 on 2021/05/22.
//

import SwiftUI

struct Home : View {
    @State var width = UIScreen.main.bounds.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            HomePage(x: $x)
            
            SlideView()
                .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x:5, y:0)
                .offset(x:x)
                .background(Color.black.opacity(x == 0 ? 0.5 : 0).ignoresSafeArea(.all, edges: .vertical).onTapGesture {
                    withAnimation {
                        x = -width
                    }
                })
        }
        .gesture(DragGesture().onChanged({ (value) in
            withAnimation{
                if value.translation.width > 0 {
                    if x < 0 {
                        x = -width + value.translation.width
                    }
                }
                else {
                    if x != -width {
                        x = value.translation.width
                    }
                }
            }
        }).onEnded({ (value) in
            withAnimation{
                if -x < width / 2 {
                    x = 0
                }
                else {
                    x = -width
                }
            }
        }))
    }
}


struct HomePage : View {
    @Binding var x : CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let colWidth = geometry.size.width / 3

            TabView {
                NavigationView {
                    VStack(){
                        NavView(colWidth: colWidth, x:$x)
                        MainView()
                    }
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "house.fill")
                }
                NavigationView {
                    VStack(){
                        NavView(colWidth: colWidth, x:$x)
                        MainView()
                    }
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                NavigationView {
                    VStack(){
                        NavView(colWidth: colWidth, x:$x)
                        MainView()
                    }
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                NavigationView {
                    VStack(){
                        NavView(colWidth: colWidth, x:$x)
                        MainView()
                    }
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "person")
                }

            }
        }
//        VStack{
//            HStack {
//                Button(action: {
//                    withAnimation{
//                        x = 0
//                    }
//                }){
//                    Image(systemName: "line.horizontal.3")
//                        .font(.system(size:24))
//                        .foregroundColor(Color.blue)
//                }
//
//                Spacer(minLength: 0)
//
//                Text("Moapp2")
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//
//                Spacer(minLength: 0)
//            }
//            .padding()
//            .background(Color.white)
//            .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
//
//            Spacer()
//        }
//        .contentShape(Rectangle())
//        .background(Color.white)
//    }
    }
}




