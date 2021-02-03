//
//  CardViews.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/03.
//

import SwiftUI

struct CardViews : View {
    
    @State var index = 0
    
    var body: some View{
        
        HStack(spacing: 25){
            
            VStack(spacing: 12){
                
                Image(systemName: SystemImageName.desktopcomputer)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("IT")
                    .foregroundColor(self.index == 0 ? .white : .black)
            }
            .padding(.horizontal, 5)
            .padding(.vertical,30)
            .background(self.index == 0 ? Color(AssetName.top) : Color.black.opacity(0.06))
            .clipShape(Capsule())
            .onTapGesture {
                
                self.index = 0
            }
            
            VStack(spacing: 12){
                
                Image(systemName: SystemImageName.quoteBubbleFill)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("Content")
                    .foregroundColor(self.index == 1 ? .white : .black)
            }
            .padding(.horizontal, 10)
            .padding(.vertical,30)
            .background(self.index == 1 ? Color(AssetName.top) : Color.black.opacity(0.06))
            .clipShape(Capsule())
            .onTapGesture {
                
                self.index = 1
            }
            
            VStack(spacing: 12){
                
                Image(systemName: SystemImageName.photoOnRectangle)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("Culture")
                    .foregroundColor(self.index == 2 ? .white : .black)
            }
            .padding(.horizontal, 10)
            .padding(.vertical,30)
            .background(self.index == 2 ? Color(AssetName.top) : Color.black.opacity(0.06))
            .clipShape(Capsule())
            .onTapGesture {
                
                self.index = 2
            }
            
            VStack(spacing: 12){
                
                Image(systemName: SystemImageName.scissors)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("Beauty")
                    .foregroundColor(self.index == 3 ? .white : .black)
            }
            .padding(.horizontal, 10)
            .padding(.vertical,30)
            .background(self.index == 3 ? Color(AssetName.top) : Color.black.opacity(0.06))
            .clipShape(Capsule())
            .onTapGesture {
                
                self.index = 3
            }
        }
        .padding(.horizontal, 25)
    }
}
