//
//  SlideView.swift
//  teamProject_pre
//
//  Created by 이재준 on 2021/05/19.
//

import SwiftUI

struct SlideView : View {
    
    @EnvironmentObject var session : SessionStore
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var show = true
    
    var body: some View {
        
        HStack(spacing: 0){
            
            VStack(alignment: .leading){
                Image(systemName: "j.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                HStack(alignment: .top, spacing: 12){
                    
                    VStack(alignment: .leading, spacing: 12){
                        Text("Jaejoon")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("@twoj")
                            .foregroundColor(.gray)
                        
                        Divider()
                            .padding(.top, 10)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation{
                            show.toggle()
                        }
                    }){
                        Image(systemName: show ? "chevron.down" : "chevron.up")
                            .foregroundColor(Color.blue)
                    }
                }
                
                // 아래 버튼 눌렀을 때 다른 뷰
                
                VStack(alignment: .leading){
                    
                    ForEach(menuButtons, id: \.self) {menu in
                        Button(action: {
                        }){
                            MenuButton(title: menu)
                        }
                    }
                    
                    Divider()
                        .padding(.top)
                    
                    Button(action: session.logout){
                        Text("Log Out").foregroundColor(Color.black)
                    }
                    
                    Divider()
                    
//                    Button(action: {
//
//                    }){
//                        Text("내 이름은")
//                            .foregroundColor(.black)
//                    }
//                    .padding(.top)
//
//                    Button(action: {
//
//                    }){
//                        Text("이재준")
//                            .foregroundColor(.black)
//                    }
//                    .padding(.top, 20)
                    
                    Spacer(minLength: 0)
                    
                    Divider()
                        .padding(.bottom)
                    
                    HStack {
//                        Button(action:{}){
//                            Image(systemName: "applelogo")
//                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
//                                .resizable()
//                                .frame(width: 26, height: 26)
//                                .foregroundColor(Color.black)
//                        }
                        Spacer()
                        VStack{
                            Text("copyrightⓒ")
                            Text("2021 All rights reserved by WIT")
                        }
                        Spacer()
//                        Button(action:{}){
//                            Image(systemName: "barcode")
//                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
//                                .resizable()
//                                .frame(width: 26, height: 26)
//                                .foregroundColor(Color.black)
//                        }
                    }
                }
                .opacity(show ? 1: 0)
                .frame(height: show ? nil : 0)
                
                VStack(alignment: .leading){
                    
                    Button(action: {}){
                        Text("Log out")
                            .foregroundColor(Color.black)
                    }
                    
                    Spacer(minLength: 0)
                }
                .opacity(show ? 0: 1)
                .frame(height: show ? 0 : nil)
            }
            .padding(.horizontal, 20)
            .padding(.top,edges!.top == 0 ? 15 : edges?.top)
            .padding(.bottom,edges!.bottom == 0 ? 15 : edges?.bottom)
            .frame(width: UIScreen.main.bounds.width - 90)
            .background(Color.white)
            .ignoresSafeArea(.all, edges: .vertical)
            
            Spacer(minLength: 0)
        }
    }
}

struct FollowView : View {
    var count: Int
    var title: String
    
    var body: some View {
        HStack{
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}

var menuButtons = ["Timeline", "Closet", "Profile"]

struct MenuButton : View {
    var title : String
    
    var body : some View {
        
        HStack(spacing: 15){
            
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
        }
        .padding(.vertical, 12)
    }
}
