//
//  AsyncImageView.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import SwiftUI

struct AsyncImageView: View {
    
    @ObservedObject private var imageLoader: ImageLoader
    @State private var image: UIImage = UIImage() // SwiftUI에는 image를 data로 생성하는게 아직 없음
    
    init(urlString: String) {
        self.imageLoader = ImageLoader(urlString: urlString)
    }
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange, perform: { data in // publisher 값이 바뀌면 이 안에 블록이 실행됨
                image = UIImage(data: data) ?? UIImage()
            })
    }
}
