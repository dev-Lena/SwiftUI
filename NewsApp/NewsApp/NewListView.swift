//
//  NewListView.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import SwiftUI

struct NewListView: View {
    
    @ObservedObject private var viewModel: NewsListViewModel
    @State private var destination = AnyView(EmptyView())
    @State private var navStatus: NavigationStatus? = .ready
    
    init() {
        self.viewModel = NewsListViewModel()
    }
    var body: some View {
        NavigationView {
            
            GeometryReader { geo in
                
                ZStack {
                    
                    NavigationLink(
                        destination: destination,
                        tag: .pop,
                        selection: $navStatus,
                        label: {EmptyView()})
                    
                    ScrollView {
                        
                        LazyVStack(alignment: .leading, spacing: 16) { // 메모리 누수가 있을 수 있으므로 보이는 부분만 뷰 생성할 수 있도록 lazyVStack 이용. (Vstack 사용할 경우 한번에 View를 다 그림.)
                            
                            ForEach(viewModel.articles.indices, id: \.self) { index in
                                let article = viewModel.articles[index]
                                
                                NewsCell (title: article.title ?? ""
                                          , subTitle: "\(article.source?.name ?? "") \(article.author ?? "")"
                                          , url: article.url ?? ""
                                          , imgURL: article.imageURL ?? "") {
                                    guard let urlString = article.url else {return}
                                    popToWebView(urlString: urlString)
                                }
                                .padding()
                                .onAppear{
                                    viewModel.loadIfNeeded(with: article)
                                }
                            }
                            .padding()
                            
                            
                        }
                    }
                    .navigationTitle("News")
                    
                    if viewModel.isLoading {
                        Color.black.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView()
                    }
                }
            }.onAppear {
                viewModel.getTopHeadLines()
            }
        }
    }
    
    private func popToWebView(urlString: String) {
        destination = AnyView(WebView(urlString: urlString)) // view 타입을 유연하게 해야할 때 AnyView
        DispatchQueue.main.async {
            navStatus = .pop
        }
    }
}

