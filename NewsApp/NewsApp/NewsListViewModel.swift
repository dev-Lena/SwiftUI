//
//  NewListViewModel.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine

final class NewsListViewModel: ObservableObject, TopHeadlinesService {
    
    @Published private var response: TopHeadlinesResponse?
    @Published var articles = [Article]()
    var apiSession: APIService
    private var cancellables: Set<AnyCancellable>
    private var page: Int
    private let pageSize: Int
    
    @Published var isLoading = false
    
    init(_ apiSession: APIService = APISession()) {
        self.apiSession = apiSession
        self.cancellables = Set<AnyCancellable>()
        self.page = 1
        self.pageSize = 10
    }
    
    /// Fetch
    func getTopHeadLines() {
        
        isLoading = true
        
        self.getTopHeadlines(page: page, pageSize: pageSize)
            .sink { result in
                APIUtils.shared.handleNetworkError(with: result) { error in
                    
                    #if DEBUG
                    if let error = error {
                        print(error)
                    }
                    #endif
                    self.isLoading(false)
                }
            } receiveValue: { (response) in
                self.response = response
                self.isLoading(false)
                guard let articles = response.articles else { return }
                self.articles += articles
            }
            .store(in: &cancellables)
        
    }
    
    private func isLoading(_ flag: Bool) {
        DispatchQueue.main.async {
            self.isLoading = flag
        }
    }
    
    func loadIfNeeded(with article: Article) {
        
        guard let totalResults = response?.totalResults else { return }
        if article == articles.last && totalResults > articles.count {
            page += 1
            getTopHeadLines()
        }
    }
}

