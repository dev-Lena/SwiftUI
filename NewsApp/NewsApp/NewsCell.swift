//
//  NewsCell.swift
//  NewsApp
//
//  Created by Keunna Lee on 2021/02/26.
//

import SwiftUI

struct NewsCell: View {
    
    private let url: String
    private let title: String
    private let subTitle: String
    private let imgUrl: String
    private let action: (() -> Void)?
    
    init(title: String, subTitle: String, url: String, imgURL: String, action: (() -> Void)? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.imgUrl = imgURL
        self.url = url
        self.action = action
    }
    
    var body: some View{
        
        Button(action: {
            action?()
        }, label: {
            VStack(alignment: .leading, spacing: 16){
                
                AsyncImageView(urlString: imgUrl)
                
                Spacer(minLength: 0)
                Text(title)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        })
        
    }
}
