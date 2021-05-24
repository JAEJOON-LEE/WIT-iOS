//
//  closetModel.swift
//  WIT_combine
//
//  Created by Park Gyurim on 2021/05/24.
//

import SwiftUI

struct Product : Hashable {
    var name : String
    var image : String
    var brand : String
    var price : Int
    var avgColor : Color
    
    init(name : String, image : String, brand : String, price : Int) {
        self.name = name
        self.image = image
        self.brand = brand
        self.price = price
        self.avgColor = Color(UIImage(named: image)!.avgColor ?? .clear)
    }
}

struct itemInfo : View {
    @Environment(\.presentationMode) var presentationMode
    let product: Product
    
    var body: some View {
        Image(product.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 330)
        Text(product.name)
            .font(.system(size: 20))
        Text("브랜드 : \(product.brand)")
        Text("가격 : \(product.price)")
        Rectangle()
            .frame(width: 50, height: 50)
            .foregroundColor(product.avgColor)
        Button("닫기") {
            presentationMode.wrappedValue.dismiss()
        }
        .padding()
    }
}

// reference : https://medium.com/swlh/swiftui-read-the-average-color-of-an-image-c736adb43000
extension UIImage {
    var avgColor : UIColor? {
        guard let inputImage = CIImage(image : self)
        else { return nil }
        let extentVector = CIVector(x : inputImage.extent.origin.x,
                                    y : inputImage.extent.origin.y,
                                    z : inputImage.extent.size.width,
                                    w : inputImage.extent.size.height)

        guard let filter = CIFilter(name : "CIAreaAverage",parameters: [kCIInputImageKey : inputImage, kCIInputExtentKey : extentVector])
        else { return nil }

        guard let outputImage = filter.outputImage
        else { return nil }

        var bitmap = [UInt8](repeating: 0, count : 4)
        let context = CIContext(options : [.workingColorSpace : kCFNull!])

        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x : 0, y : 0, width : 1, height: 1), format : .RGBA8, colorSpace: nil)

        return UIColor(red : CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}
