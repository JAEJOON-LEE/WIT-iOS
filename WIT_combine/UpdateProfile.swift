//
//  ContentView.swift
//  LoginPageEN
//
//  Created by Farukh IQBAL on 25/02/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import SwiftUI

struct UpdateProfile : View {

    @State var index = 0
    @Namespace var name

    var body: some View{

            VStack{
                Text("회원 정보 수정")
                    .font(.system(size : 30))
                    .fontWeight(.bold)
                
                Divider()
            }
            .padding(.top)

                NewProfile()
    }
}

struct NewProfile : View {

    @State var user = "999rimmy" // Binding으로 바꿔야할듯?
    @State var password = ""
    @State var password2 = ""
    @State var comment = "마이네임이즈규림파크"
//    @State var age = ""
//    @State var gender = ""
//    var genders = ["Man", "Woman"]

    var body: some View{

        VStack{

            HStack{

                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("\(user) 님,") //아이디 출력
                        .font(.title)
                        .fontWeight(.bold)

                    Button(action: {}) {

                        Text("당신의 첫 인상을 관리합니다.")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                    }
                }
                Spacer(minLength: 0)


                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85, height: 85)
        }
        .padding(.horizontal,25)
        .padding(.top,30)

        VStack(alignment: .leading, spacing: 15) {

            Text("Password")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)

            TextField("password to be changed", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                            // shadow effect...
                .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)

            TextField("type password again", text: $password2)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                            // shadow effect...
                .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)
                
            
            Text("Comment")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)

            TextField("Please write down your state.", text: $comment)
                .frame(height: 150)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                            // shadow effect...
                .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
        Spacer()
        HStack {
        Button(action: {}) {

            Text("저장")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width/2-50)
        }
        
        
        Button(action: {}) {

            Text("취소")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width/2-50)
                .background(Color.white)        }
        }
        }
        .padding(.horizontal,25)
        .padding(.top,25)
    }
}
