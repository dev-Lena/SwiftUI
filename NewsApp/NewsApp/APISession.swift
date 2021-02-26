//
//  APISession.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<T>(with request: URLRequest) -> AnyPublisher<T, APIError> where T : Decodable {
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)// 어떤 큐에서 받을건지 선택. (디스패치 큐 메인로 해도 같음)
            .mapError{ _ in .unknown}
            .flatMap{data, response -> AnyPublisher<T, APIError> in // map은 다른 타입으로 반환해야하기 때문에 flatMap 이용.
                
                if let response = response as? HTTPURLResponse{
                    if (200...299).contains(response.statusCode) {
                        
                        let decoder = JSONDecoder()
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError{ _ in .decodingError }
                            .eraseToAnyPublisher()
                        
                    } else {
                        return Fail(error: .httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: .unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
