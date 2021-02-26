//
//  TopHeadlinesService.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine

protocol TopHeadlinesService {
    var apiSession: APIService { get }
    func getTopHeadlines(page: Int, pageSize: Int) -> AnyPublisher<TopHeadlinesResponse, APIError>
}

extension TopHeadlinesService {
    func getTopHeadlines(page: Int, pageSize: Int) -> AnyPublisher<TopHeadlinesResponse, APIError> {
        let endpoint = TopHeadlinesEndpoint().getTopHeadlines(page: page, pageSize: pageSize)
        
        guard let request = endpoint else {
            preconditionFailure("Invalid Request")
        }
        return apiSession.request(with: request)
    }
}
