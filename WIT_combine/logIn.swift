//
//  ContentView.swift
//  LoginPageEN
//
//  Created by Farukh IQBAL on 25/02/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseDatabase

struct logIn : View {

    @State var index = 0
    @Namespace var name
    var body: some View{
        VStack{

            Text("WIT")
                .font(.system(size : 30))
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(width: 70)

            HStack(spacing: 0){

                Button(action: {

                    withAnimation(.spring()){

                        index = 0
                    }

                }) {

                    VStack{

                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)

                            ZStack{

                            // slide animation....
                            Capsule()
                            .fill(Color.black.opacity(0.04))
                            .frame( height: 4)

                            if index == 0{

                            Capsule()
                                .fill(Color.black)
                            .frame( height: 4)
                                .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }

                Button(action: {

                    withAnimation(.spring()){

                        index = 1
                    }

                }) {

                    VStack{

                        Text("Sign Up")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)

                            ZStack{

                            // slide animation....
                            Capsule()
                            .fill(Color.black.opacity(0.04))
                            .frame( height: 4)

                            if index == 1{

                            Capsule()
                                .fill(Color.black)
                            .frame( height: 4)
                                .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            .padding(.top,30)

            // Login View...

            // Changing Views Based On Index...

            if index == 0{

                Login()
            }
            else{

                SignUp()
            }
        }
    }
}


struct Login : View {

    @State var id = ""
    @State var password = ""

    var body: some View{
        VStack{

            HStack{

                VStack(alignment: .leading, spacing: 12) {

                    Text("Hello,")
                        .fontWeight(.bold)

                    Text("Here is WIT")
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

                Text("ID")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                TextField("id", text: $id)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                    .shadow(color: Color.black.opacity(0.08), radius:5, x:0, y:-5)

                Text("Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                TextField("password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                    .shadow(color: Color.black.opacity(0.08), radius:5, x:0, y:-5)
//
//                Button(action: {}) {
//
//                    Text("Forget Password")
//                        .font(.system(size: 14))
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.black)
//                }
//                .padding(.top,10)
            }
            .padding(.horizontal,25)
            .padding(.top,25)

            // Login Button....

            Button(action: {
            }) {

                NavigationLink(destination: Home()){
                Text("Login")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color.black ,Color.gray]),
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                }
                .cornerRadius(8)
            }
            
            .padding(.horizontal,25)
            .padding(.top,25)
            // Social Buttons...

            Button(action: {}) {

                HStack(spacing: 30){

                    Image(systemName: "message")
                        .font(.system(size: 26))
                        .foregroundColor(Color.black)

                    Text("LogIn using KakaoTalk")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)

                    Spacer(minLength: 0)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                }
                .padding(.horizontal,25)

//            HStack(spacing: 30){
//
//                ForEach(social,id: \.self){name in
//
//                    Button(action: {}) {
//
//                        Image(systemName: name)
//                            .renderingMode(.template)
//                            .resizable()
//                            .frame(width: 24,height: 24)
//                            .foregroundColor(Color.black)
//                    }
//                }
//            }
//            .padding(.top,25)
        }
    }
}

var social = ["applelogo","applelogo","applelogo"]

struct SignUp : View {

    @State var user = ""
    @State var password = ""
    @State var password2 = ""
    @State var age = ""
    @State var gender = ""
    var genders = ["Man", "Woman"]

    var body: some View{

        VStack{

            HStack{

                VStack(alignment: .leading, spacing: 12) {

                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer(minLength: 0)
        }
        .padding(.horizontal,25)
        .padding(.top,30)

        VStack(alignment: .leading, spacing: 15) {


            Text("ID")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)

            TextField("ID", text: $user)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                // shadow effect...
                .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)

            Text("Password")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)

            TextField("password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                            // shadow effect...
                .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)


            Text("Password Verification")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)

            TextField("type password again", text: $password2)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                            // shadow effect...
                .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)

            GeometryReader { geometry in
            HStack {
                VStack{
                    Text("Age")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    TextField("Age", text: $age)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                                    // shadow effect...
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)
                }
                .frame(maxWidth: geometry.size.width / 2)

//                VStack {
//                    Text("Gender")
//                        .font(.caption)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//
//                    Picker(selection: $gender, label: Text("Gender")) {
//                                    ForEach(0 ..< genders.count) {
//                                        Text(self.genders[$0])
//                        }
//                    }
//                }
                VStack{
                    Text("Gender")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    TextField("Man or Woman", text: $gender)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                                    // shadow effect...
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x:0, y:-5)
                }
                .frame(maxWidth: geometry.size.width / 2)

            }
            }
        }
            .padding(.horizontal,25)
            .padding(.top,25)

        // Login Button....

        Button(action: {}) {

            Text("Sign Up")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(
                    LinearGradient(gradient: .init(colors: [Color.black, Color.gray]),
                                    startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(8)
        }
        .padding(.horizontal,25)
        .padding(.top,25)

        // Social Buttons...

        Button(action: {}) {

            HStack(spacing: 25){

                Image(systemName: "message.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.black)

                Text("SignUp using KakaoTalk")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                .fontWeight(.bold)
                    .foregroundColor(Color.black)

                Spacer(minLength: 0)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

        }
        .padding(.horizontal,25)

//        HStack(spacing: 30){
//
//            ForEach(social,id: \.self){name in
//
//                Button(action: {}) {
//
//                    Image(name)
//                        .renderingMode(.template)
//                        .resizable()
//                        .frame(width: 24,height: 24)
//                        .foregroundColor(Color(name == "google" ? .black : .gray))
//                    }
//                }
//            }
//            .padding(.top,25)
        }
    }
}

//let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
//
//let storedUsername = "1234"
//let storedpassword = "1234"
//
//struct logIn: View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//
//    @State var authenticationDidFail: Bool = false
//    @State var authenticationDidSucceed: Bool = false
//
//    var body: some View {
//        NavigationView{
//            VStack {
//                HelloText()
//                UserImage()
//                UsernameTextField(username: $username)
//                PasswordSecureField(password: $password)
//                if authenticationDidFail {
//                    Text("Information not correct. Try again.")
//                        .offset(y: -10)
//                        .foregroundColor(.red)
//                }
//
//                Button(action: {
//                    if self.username == storedUsername && self.password == storedpassword {
//                        self.authenticationDidSucceed = true
//                        self.authenticationDidFail = false
//
//                    } else {
//                        self.authenticationDidFail = true
//                        self.authenticationDidSucceed = false
//                    }
//                }) {
//                        NavigationLink(destination: Home()){
//                        LoginButtonContent()
//                    }
//                }
//
//                Button(action: {
//                    //
//                }){
//                    SignUpButtonContent()
//                }
//            }
//            .padding()
//
//            if authenticationDidSucceed {
//                    Text("Login succeeded!")
//                        .font(.headline)
//                        .frame(width: 250, height: 80)
//                        .background(Color.yellow)
//                        .cornerRadius(20.0)
//                        .animation(Animation.default)
//            }
//    }
//}
//}
//
//struct HelloText: View {
//    var body: some View {
//        Text("모앱2 팀9")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .padding(.bottom, 20)
//    }
//}
//
//struct UserImage: View {
//    var body: some View {
//        Image(systemName: "applelogo")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 150, height: 150)
//            .padding(.bottom, 75)
//    }
//}
//
//struct LoginButtonContent: View {
//    var body: some View {
//        Text("LOGIN")
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 220, height: 60)
//            .background(Color.black)
//            .cornerRadius(35.0)
//    }
//}
//
//struct SignUpButtonContent: View {
//    var body: some View {
//        Text("회원가입")
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 220, height: 60)
//            .background(Color.black)
//            .cornerRadius(35.0)
//    }
//}
//
//struct UsernameTextField: View {
//
//    @Binding var username: String
//
//    var body: some View {
//        TextField("Username", text: $username)
//            .padding()
//            .background(lightGreyColor)
//            .cornerRadius(5.0)
//            .padding(.bottom, 20)
//    }
//}
//
//struct PasswordSecureField: View {
//
//    @Binding var password: String
//
//    var body: some View {
//        SecureField("Password", text: $password)
//            .padding()
//            .background(lightGreyColor)
//            .cornerRadius(5.0)
//            .padding(.bottom, 20)
//    }
//}
