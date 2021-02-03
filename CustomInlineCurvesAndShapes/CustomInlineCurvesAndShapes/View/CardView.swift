//
//  CardView.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/03.
//

import SwiftUI

class CardViewModel {
    @State var currentIndex = 0
}

struct CardView: View {
    
    let cardViewModel: CardViewModel
    @State var cardIndex: Index
    @State var systemImageName: ImageName
    @State var text: String
    @State var horizontalPadding: CGFloat
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Image(systemName: self.systemImageName)
                .font(.title)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            Text(self.text)
                .foregroundColor(self.cardIndex == cardViewModel.currentIndex ? .white : .black)
        }
        .padding(.horizontal, self.horizontalPadding)
        .padding(.vertical, 30)
        .background(self.cardIndex == cardViewModel.currentIndex ? Color(AssetName.top) : Color.black.opacity(0.06))
        .clipShape(Capsule())
        .onTapGesture {
            self.cardViewModel.currentIndex = self.cardIndex
        }
    }
    
}
