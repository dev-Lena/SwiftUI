//
//  TopHeadlinesEndpoint.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine

final class TopHeadlinesEndpoint: BaseService {
    
    func getTopHeadlines(page: Int, pageSize: Int) -> URLRequest? {
        
        var queies: [URLQueryItem] {
            return [
                URLQueryItem(name: "country", value: "us"),
                URLQueryItem(name: "apiKey", value: APIKey),
                URLQueryItem(name: "pageSize", value: "\(pageSize)"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
        
        return getURLRequest(path: "/v2/top-headlines", queries: queies, method: .get)
    }
}
