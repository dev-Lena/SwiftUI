//
//  WebView.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
