//
//  PostService.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/06/16.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class PostService {
    static var Posts = AuthService.storeRoot.collection("posts")
    
    static var AllPosts = AuthService.storeRoot.collection("allPosts")
    static var TimeLine = AuthService.storeRoot.collection("timeline")
    
    static func PostsUserId(userId: String) -> DocumentReference{
        return Posts.document(userId)
    }
    static func timelineUserId(userId: String) -> DocumentReference{
        return TimeLine.document(userId)
    }
    static func uploadPost(caption: String, imageData: Data , onSuccess: @escaping() -> Void,onError: @escaping(_ errorMessage: String)->Void){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        //let userId = "1234"
        
        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID
        
        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
    
    }
}


