//
//  categoryView.swift
//  WIT_combine
//
//  Created by ju young jeong on 2021/06/15.
//

import SwiftUI

struct categoryView: View {
    private var numberOfCate = 3
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var currentIndex = 0
    
    func previous(){
        withAnimation{
            currentIndex = currentIndex > 0 ?
                currentIndex - 1 : numberOfCate - 1
        }
    }
    
    func next(){
        withAnimation{
            currentIndex = currentIndex <
                numberOfCate ? currentIndex + 1 : 0
        }
    }
    
    
    var body: some View {
        GeometryReader{ proxy in
            TabView(selection: $currentIndex) {
                ForEach(0..<numberOfCate){ num in
                    NavigationLink(
                        destination: closetView(),
                        label: {
                            Image("\(num)")
                                .resizable()
                                .overlay(Color.black.opacity(0.2))
                                .scaledToFit()
                                .tag(num)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10.0)
                        })
                }
            }
            .shadow(radius: 10)
            .tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            //.frame(width: proxy.size.width, height: proxy.size.height)
            .onReceive(timer, perform: { _ in
                next()
            })
            .padding(.vertical, 20)
        }//Geometry view
        .navigationBarHidden(true)
    }
}

struct categoryView_Previews: PreviewProvider {
    static var previews: some View {
        categoryView()
            .previewLayout(.device)
            .previewDevice("iPhone 12 Pro")
    }
}
