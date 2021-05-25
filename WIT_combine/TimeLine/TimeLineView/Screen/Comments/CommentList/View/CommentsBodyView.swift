//
//  CommentsBodyView.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/05/25.
//

import SwiftUI

struct CommentsBodyView: View {
    @StateObject var vm: CommentsBodyViewModel = CommentsBodyViewModel()
    var colWidth: CGFloat

    var body: some View {
        ScrollView {
            ForEach(vm.allComments){ comment in
                CommentItemAndResponseView(comment: comment,colWidth:colWidth)
            }
        }
    }
}

