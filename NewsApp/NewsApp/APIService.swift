//
//  APIService.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, APIError> 
}
