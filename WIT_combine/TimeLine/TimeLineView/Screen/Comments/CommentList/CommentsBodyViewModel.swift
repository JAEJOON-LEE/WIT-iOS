//
//  CommentsBodyViewModel.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/05/25.
//

import Foundation

class CommentsBodyViewModel: ObservableObject {
    
    @Published var allComments: [Comment]

    init() {
        allComments = ApiService.commentsApi.getComments()
    }

}
