
//
//  PostView.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/06/15.
//

import SwiftUI

struct PostView: View {
    
    @State private var postImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No!!"
    @State private var dscText = ""
    @State private var titleText = ""
    
    func loadImage(){
        guard let inputImage = pickedImage else{ return}
        
        postImage = inputImage
    }
    func clear(){
        self.titleText = ""
        self.dscText = ""
        self.imageData = Data()
        self.postImage = Image(systemName: "photo.fill")
    }
    func uploadPost(){
        if let error = errorCheck(){
            self.error = error
            self.showingAlert = true
            self.clear()
            return
        }
        
        PostService.uploadPost(caption: dscText, imageData: imageData, onSuccess : {
            self.clear()
        }){
            (errorMessage) in
            self.error = errorMessage
            self.showingAlert = true
            return
        }
        
    }
    func errorCheck() -> String? {
        if titleText.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty || dscText.trimmingCharacters(in: .whitespaces).isEmpty{
            return "please add a caption and provide an image"
        }
        return nil
    }
    
    var body: some View {
        VStack{
            Text("New Post").font(.largeTitle)
            
            VStack{
                if postImage != nil {
                    postImage!.resizable()
                        .frame(width: 340, height: 250)
                        .onTapGesture {
                            self.showingActionSheet = true
                        }
                } else{
                    Image(systemName: "photo.fill").resizable()
                        .frame(width: 340, height: 250)
                        .onTapGesture {
                            self.showingActionSheet = true
                        }
                }
            }
            .padding(.bottom)
            HStack{
                Text("#Title")
                Spacer()
            }
            .padding(.leading)
            TextEditor(text: $titleText)
                .frame(height: 30)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue))
                .padding(.horizontal)
            
            HStack{
                Text("#Description")
                Spacer()
            }
            .padding(.leading)
            TextEditor(text: $dscText)
                .frame(height: 60)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue))
                .padding(.horizontal)
            Button(action:uploadPost){
                Text("Upload Post").font(.title)
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
            }
            .padding(.bottom,20)
            .padding(.top,5)
                
        }.padding()
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
            ImagePicker(pickedImage: self.$pickedImage, showingImagePicker: self.$showingImagePicker, imageData:self.$imageData)
        }.actionSheet(isPresented: $showingActionSheet){
            ActionSheet(title: Text(""),buttons: [
                .default(Text("Choose")){
                    self.sourceType = .photoLibrary
                    self.showingImagePicker = true
                },
                .default(Text("Take a Photo")){
                    self.sourceType = .camera
                    self.showingImagePicker = true
                }, .cancel()
            ])
        }
        
    }
}


