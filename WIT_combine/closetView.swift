//
//  closetView.swift
//  WIT_combine
//
//  Created by Park Gyurim on 2021/05/24.
//

import SwiftUI

struct closetView: View {
    @State var showingSheet = false
    @State var tempCloth : Product = Product(name: "", image: "product1" , brand: "", price: 0)
    
    var products : [Product] = [
        Product(name: "코듀로이 오버 칼라 아노락 스웨트셔츠", image : "product1", brand: "라퍼지스토어", price: 26535),
        Product(name: "CREW NECK RIB KNIT SWEATER_BROWN",image : "product2", brand: "BLOND9", price: 30000),
        Product(name: "Half-neck Sweat L/beige",image : "product3", brand: "JEEP", price: 59000),
        Product(name: "아치 로고 맨투맨 네이비",image : "product4", brand: "COVERNOT", price: 57000),
        Product(name: "SIGNATURE HOODIE_lemon",image : "product5", brand: " 5252BYOIOI", price: 43371),
        Product(name: "SIGNATURE HOODIE_light purple",image : "product6", brand: "5252BYOIOI", price: 43371),
        Product(name: "Basic Logo Hood D/Pink",image : "product7", brand: "JEEP", price: 89000),
        Product(name: "purple 맨투맨",image : "product8", brand: "라퍼지스토어", price: 28000),
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
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(maximum: 100)), GridItem(.flexible(maximum: 100)), GridItem(.flexible(maximum: 100))
            ]) {
                ForEach(products, id : \.self) { product in
//                    Image($0.image)
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .onTapGesture {
                            showingSheet = true
                            tempCloth = product
                        }
                        .sheet(isPresented: $showingSheet) {
                            itemInfo(product: tempCloth)
                        }
                }
            }
        }
    }
}
