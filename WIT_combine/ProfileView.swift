//
//  ProfileView.swift
//  WIT_combine
//
//  Created by 이재준 on 2021/06/16.
//

import SwiftUI

struct ProfileView : View {
    
    @State var userName = "User Name"
    @State var userId = "UserID"
    @State var comment = "정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 정기숙 교수님 최고 "
    var body : some View{
        VStack {
        Image("person1") //프로필사진
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.top)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.yellow, lineWidth: 5))
            .shadow(radius: 5)
        VStack{
            
            Spacer()
            
            ZStack(alignment: .top) {
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            Text("\(userName)").font(.title)
                            //이름
                        }
                        
                        Spacer()
                        HStack(spacing: 8){
                            
                            Text("@\(userId)")
                            //아이디
                            
                        }.padding(8)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        
                    }.padding(.top,35)
                    
                    Text("\(comment)")
                        .padding(.top)
                }
                .padding()
                .background(Color.black.opacity(0.4))
                .foregroundColor(.white)
                .clipShape(BottomShape())
                .cornerRadius(25)
                ZStack{
                    
                    Button(action: {
                        var screen = takeCapture()
                        print(screen)
                    }) {
                        
                        Image("ScreenCapture").renderingMode(.original)
                            .imageScale(.large)
                            .frame(width: 25, height: 25)
                            .padding(20)
                            .background(Color.white)
                            .clipShape(Circle())
                    }//클릭하면 이미지 업로드 창
                    
                    Circle().stroke(Color.yellow, lineWidth: 5).frame(width: 70, height: 70)
                
            }.offset(y: -35)
                
                HStack{
                    NavigationLink(
                        destination: UpdateProfile(),//.navigationBarHidden(true),
                        label: {
                            Image(systemName: "slider.horizontal.3").renderingMode(.original).resizable()
                                .frame(width: 25, height: 20)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        })
                    
                    Spacer()
                    Button(action: {
                        //클릭하면 Home()으로 이동하던가 디비 세션 끊기
                    }) {
                        
                        Image("logout").renderingMode(.original).resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    }
                }
                .offset(y: -25)
                .padding(.horizontal,35)
            }
        }
        .padding()
        }
    }
}

struct BottomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path {path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}

func takeCapture() -> UIImage {
        var image: UIImage?
        guard let currentLayer = UIApplication.shared.windows.first { $0.isKeyWindow }?.layer else { return UIImage() }

        let currentScale = UIScreen.main.scale

        UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale)

        guard let currentContext = UIGraphicsGetCurrentContext() else { return UIImage() }

        currentLayer.render(in: currentContext)

        image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image ?? UIImage()
    }

