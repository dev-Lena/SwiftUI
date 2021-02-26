//
//  APIError.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
