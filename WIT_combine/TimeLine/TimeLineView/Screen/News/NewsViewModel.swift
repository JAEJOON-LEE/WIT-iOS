//
//  NewsViewModel.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/24.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: News?
    @Published var show: Bool = true
    
    init() {
        news = ApiService.newsApi.getLatestNews()
    }
    
}
