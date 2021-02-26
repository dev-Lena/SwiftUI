//
//  APIUtils.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine
struct APIUtils {
    static let shared = APIUtils()
    private init() {}
    
    // Network Handling
    func handleNetworkError(with result: Subscribers.Completion<APIError>, onFail: ((APIError?) -> Void)? = nil) {
        switch result {
        case .failure(let error):
            onFail?(error)
        case .finished: break
        }
    }
}
