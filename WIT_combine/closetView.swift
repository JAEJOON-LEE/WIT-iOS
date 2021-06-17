//
//  closetView.swift
//  WIT_combine
//
//  Created by Park Gyurim on 2021/05/24.
//

import SwiftUI

struct closetView: View {
    @State var showingSheet = false
    
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
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(maximum: 140)),
                GridItem(.flexible(maximum: 140)),
                GridItem(.flexible(maximum: 140))
            ]) {
                ForEach(products, id : \.self) { product in
                    NavigationLink(destination: itemInfo(product : product)) {
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(12)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                    }
                }
            }//.background(Color.secondary)
        } // scrollview
        .navigationBarTitle(Text("CategoryName"))
    }
}

struct itemInfo : View {
//    @Environment(\.presentationMode) var presentationMode
    let product: Product
    @State var isClicked : Bool = false
    @State private var scaleValue = CGFloat(1)
    @State private var heartBtnColor : Color = Color.white

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width*0.80, height: 350)
                        //.clipped()
                        .frame(width: geometry.size.width*0.80, height: 350)
                        .padding(10)
                        // tap effect
                        .scaleEffect(self.scaleValue)
                        .onTapGesture {
                            withAnimation { self.scaleValue = 1.05 }
                            withAnimation(Animation.linear.delay(0.2)) { self.scaleValue = 1.0 }
                        }
                        .padding(.top, 10)
                    Spacer()
                }
                .overlay(
                    Rectangle()
                        .frame(width : UIScreen.main.bounds.width)
                        .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                        .opacity(0.1)
                )
                
                VStack {
                    Spacer()
                    // Text Information
                    VStack {
                        Spacer()
                            .frame(height : 30)
                        
                        HStack {
                            Text(product.name)
                                .font(.custom("Roboto Regular", size: 30))
                                .padding(.horizontal, 20)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text("\(product.cate) > \(product.subCate)")
                                .font(.custom("Roboto Regular", size: 20))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)

                        
                        HStack {
                            Spacer()
                            Text("₩\(product.price)")
                                .font(.custom("Roboto Regular", size: 30))
                        }
                        .padding(.horizontal, 20)

                        Spacer()
                        HStack {
                            Button(action: {
                                if (heartBtnColor == Color.white) {
                                    heartBtnColor = Color.red
                                } else {
                                    heartBtnColor = Color.white
                                }
                            }, label: {
                                Image(systemName: "suit.heart.fill")
                                    .font(.system(size : 30))
                                    .frame(width : 70, height : 70)
                                    .foregroundColor(heartBtnColor)
                                    //.background(product.avgColor)
                                    .background(Color.secondary)
                                    .cornerRadius(15)
                            })
                            
                            Text("이 옷과 어울리는 옷 보기")
                                .frame(width: geometry.size.width * 0.7, height: 70)
                                .foregroundColor(Color.white)
                                //.background(product.avgColor)
                                .background(Color.secondary)
                                .cornerRadius(15)
                                .onTapGesture {
                                    isClicked = true
                                }
                        } // HStack
                        .shadow(radius: 5)
                        .padding(.bottom, 40)
                    } // VStack
                    .background(product.avgColor)
                    .background(LinearGradient(gradient: Gradient(colors: [product.avgColor, product.avgColor.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(30)
                    .frame(height : geometry.size.height / 2)
                    // Text Information
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text(product.brand), displayMode: .inline)//, displayMode: .inline)
            .sheet(isPresented: $isClicked) {
                recommendItemView(product: product, isClicked: $isClicked)
            }
        }

    }
}

struct recommendItemView : View {
    let product : Product
    @Binding var isClicked : Bool
    
    var body : some View {
        VStack {
            HStack {
                Text("이 옷과 어울리는 옷") // temp
                    .font(.custom("Roboto Regular", size: 25))
                Spacer()
                    .frame(width : 50)
                Button {
                    isClicked = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size : 20))
                        .foregroundColor(.black)
                }
            } // HStack
            .padding(.top, 20)
            Rectangle().foregroundColor(product.avgColor)
            Spacer()
        }
        .frame(width : UIScreen.main.bounds.width)
        // recommend clothes with algorithm
    }
}

struct itemInfo_Previews: PreviewProvider {
    static var previews: some View {
        itemInfo(product: Product(name: "CREW NECK RIB KNIT SWEATER_BROWN", cate: "상의", subCate: "반팔", image : "product2", brand: "BLOND9", price: 30000))
    }
}
