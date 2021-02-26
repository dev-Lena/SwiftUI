//
//  ImageLoader.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import Foundation
import Combine

final class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>() // 관련 view 에서 didChange를 감지해서 자신(view)를 업데이트함.
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    // init 될 때 이미지 요청됨.
    init(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared
            .dataTask(with: url) { (data, response, error) in
                
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        task.resume()
    }
}
