//
//  PopularSearchView.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/03.
//

import SwiftUI

class PopularSearchViewModel {
    @State var currentIndex = 0
}

struct PopularSearchView: View {
    
    let popularSearchViewModel: PopularSearchViewModel
    let field: String
    let position: String
    let openPosition: String
    @State var index: Index
    
    var body: some View {
        
        VStack(spacing: 10){
            
            HStack{
                
                Spacer()
                
                Image(AssetName.picture)
                    .resizable()
                    .frame(width: 100, height: 70)
            }
            
            HStack{
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Text("\(self.field)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Text("\(self.position)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Text("\(self.openPosition)")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.leading, 25)
        }
        // setting custom width
        .padding(.bottom, 20)
        .frame(width: UIScreen.main.bounds.width / 2)
        .background(self.index == popularSearchViewModel.currentIndex ? Color("select") : Color.black.opacity(0.06))
        .cornerRadius(35)
        .onTapGesture {
//            popularSearchViewModel.currentIndex = self.index
            self.index = popularSearchViewModel.currentIndex
        }
    }
}
