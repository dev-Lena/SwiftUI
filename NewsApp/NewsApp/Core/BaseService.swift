//
//  BaseService.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation

class BaseService {
    // http://newsapi.org/v2/everything?q=tesla&from=2021-01-26&sortBy=publishedAt&apiKey=989e9823d82848618ff025c8af93ae09
    
    private let host = "newsapi.org"
    
    func getURLRequest(path: String = "", queries: [URLQueryItem]? = nil, method: HTTPMethod) -> URLRequest?{
        let urlComponents = getURLComponent(path: path, queries: queries)
        guard let url = urlComponents.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.timeoutInterval = 60.0
        
        return request
    }
    
    private func getURLComponent(path: String, queries: [URLQueryItem]? = nil) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queries
        return urlComponents
    }
    
    enum HTTPMethod: String {
        case get = "GET"
    }
    
}
