//
//  closetView.swift
//  WIT_combine
//
//  Created by Park Gyurim on 2021/05/24.
//

import SwiftUI

struct closetView: View {
    @State var showingSheet = false
    @State var showCategorySelector = false
    
    var products : [Product] = [
        Product(name: "코듀로이 오버 칼라 아노락 스웨트셔츠", cate: "상의", subCate: "반팔", image : "product1", brand: "라퍼지스토어", price: 26535),
        Product(name: "CREW NECK RIB KNIT SWEATER_BROWN", cate: "상의", subCate: "반팔", image : "product2", brand: "BLOND9", price: 30000),
        Product(name: "Half-neck Sweat L/beige", cate: "상의", subCate: "반팔", image : "product3", brand: "JEEP", price: 59000),
        Product(name: "아치 로고 맨투맨 네이비", cate: "상의", subCate: "반팔", image : "product4", brand: "COVERNOT", price: 57000),
        Product(name: "SIGNATURE HOODIE_lemon", cate: "상의", subCate: "반팔", image : "product5", brand: " 5252BYOIOI", price: 43371),
        Product(name: "SIGNATURE HOODIE_light purple", cate: "상의", subCate: "후드", image : "product6", brand: "5252BYOIOI", price: 43371),
        Product(name: "Basic Logo Hood D/Pink", cate: "상의", subCate: "후드", image : "product7", brand: "JEEP", price: 89000),
        Product(name: "purple 맨투맨", cate: "상의", subCate: "반팔", image : "product8", brand: "라퍼지스토어", price: 28000),
        Product(name: "purple 맨투맨", cate: "상의", subCate: "긴팔", image : "product9", brand: "라퍼지스토어", price: 28000),
        Product(name: "purple 맨투맨", cate: "상의", subCate: "긴팔", image : "product10", brand: "라퍼지스토어", price: 28000),
        Product(name: "purple 맨투맨", cate: "상의", subCate: "긴팔", image : "product11", brand: "라퍼지스토어", price: 28000),
        Product(name: "purple 맨투맨", cate: "상의", subCate: "긴팔", image : "product12", brand: "라퍼지스토어", price: 28000),
        Product(name: "purple 맨투맨", cate: "상의", subCate: "반팔", image : "product13", brand: "라퍼지스토어", price: 28000),
        //Product(name: "my plastic bag_CQTAX21221PPX",image : "product9", brand: "CUSTOMELOW", price: 89000),
//        Product(File: "upper10",Name: "빈티지라벨 맨투맨",Brand: "FILA",Price: 59000),
//        Product(File: "upper11",Name: "부클 쿠퍼 로고 크루넥 브리티쉬그린",Brand: "COVERNAT ",Price: 57000),
//        Product(File: "upper12",Name: "CREW NECK RIB KNIT SWEATER_BLACK",Brand: "BLOND9",Price: 30000),
//        Product(File: "upper13",Name: "CNTT ESSENTIAL OVER-FIT T-SHIRT",Brand: "CONATT",Price: 30000),
//        Product(File: "upper14",Name: "빅 트위치 로고 티셔츠",Brand: "LEE",Price: 30000),
//        Product(File: "upper15",Name: "1987MMLG HF-T",Brand: "MNLG",Price: 30000)
    ]
    
    var body: some View {
//        List(products, id : \.self) {
//            itemCardView(product : $0)
//        }
        NavigationView {
            ZStack(alignment : .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(maximum: 100)),
                        GridItem(.flexible(maximum: 100)),
                        GridItem(.flexible(maximum: 100))
                    ]) {
                        ForEach(products, id : \.self) { product in
                            NavigationLink(destination: itemInfo(product : product)) {
                                Image(product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }.navigationBarHidden(true)
                        }
                    }
                } // scrollview
                
                Button {
                    withAnimation {
                        showCategorySelector = true
                    }
                } label : {
//                    Image(systemName: "rectangle.3.offgrid.fill")
//                    Text("+")
//                        .font(.system(size : 30))
//                        .foregroundColor(.white)
//                        .padding()
//                        .clipShape(Circle())
                    Circle()
                        .frame(width: 60, height: 60)
                        .padding(15)
                }
                if showCategorySelector {
                    VStack {
                        Button(action: {
                            //withAnimation {
                                showCategorySelector = false
                            //}
                        }, label: {
                            Text("X")
                        })
                        Image("marneking")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height : 600)
                            .foregroundColor(.gray)
                    }
                }
            } // ZStack
            
        } // navigationview
    }
}

struct itemInfo : View {
//    @Environment(\.presentationMode) var presentationMode
    let product: Product
    @State var isClicked : Bool = false
    
    var body: some View {
        ScrollView{
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Image(product.image)
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width*0.80, height: 350)
                            .clipped()
                        .frame(width: geometry.size.width*0.80, height: 350)
                    
                    Text(product.name)
                        .font(.custom("Roboto Regular", size: 20))
                        .frame(width: geometry.size.width*0.80, height: 60,alignment: .topLeading)
                    
                    
                    HStack{
                        Text("\(product.cate) > \(product.subCate)").font(.custom("Roboto Regular", size: 16)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.37)))
                        
                        Spacer(minLength: 50)
                        
                        Text("\(product.price)₩")
                            .font(.custom("Roboto Regular", size: 16))
                            
                    }.frame(width: 370, height: 60,alignment: .topLeading)
                    
                    
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(product.avgColor)
                        .cornerRadius(15)
                        .onTapGesture {
                            isClicked = true
                        }
                    
            //        Button("닫기") {
            //            presentationMode.wrappedValue.dismiss()
            //        }
                }.navigationBarTitle(Text(product.brand))//, displayMode: .inline)
                .sheet(isPresented: $isClicked) {
                    recommendItemView(product: product)
                }
            }
        }
    }
}

struct recommendItemView : View {
    let product : Product
    var body : some View {
        HStack {
            Rectangle()
                .foregroundColor(product.avgColor)
                .frame(width : 100, height : 50)
            Text("이 옷과 어울리는 옷들")
        }
    }
}
