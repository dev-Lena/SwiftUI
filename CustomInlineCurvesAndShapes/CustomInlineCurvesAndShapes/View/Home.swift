//
//  Home.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/02.
//

import SwiftUI

struct Home: View {
    
    let cardViewModel = CardViewModel()
    let popularSearchViewModel = PopularSearchViewModel()
    
    var body: some View {
        
        // MARK: - Top View
        VStack {
            HStack {
                
                Button(action: {
                    
                }) {
                    Image(systemName: SystemImageName.circleGrid)
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Image(AssetName.profile)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
            .padding(.bottom, 80)
            .background(Color(AssetName.top))
            .clipShape(Corners(corner: [.bottomRight], size: CGSize(width: 55, height: 55)))
            
            // MARK: - Word Bubble Shape View
            HStack {
                
                VStack {
                    
                    // image
                    HStack {
                        Spacer()
                        
                        Image(AssetName.picture)
                            .resizable()
                            .frame(width: 170, height: 130)
                    }
                    // moving bottom view slightly up...
                    .padding(.bottom, -35)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Welcome")
                                .font(.title)
                            Text("Find your \ndream Job!")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 30)
                }
                // setting custom width
                .padding(.bottom, 35)
                .frame(width: UIScreen.main.bounds.width - 100)
                .background(Color(AssetName.select))
                .clipShape(Corners(corner: [.topLeft, .topRight, .bottomRight], size: CGSize(width: 70, height: 70)))
                Spacer()
            }
            // moving view up
            .padding(.top, -70)
            
            
            // MARK: - Explore Categories View
            // create simple bottomleft outline corner radius
            ZStack {
                Color(AssetName.select)
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    HStack {
                        Text("Explore Categories")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: SystemImageName.ellipsis)
                                .font(.title)
                        }
                        
                    }
                    .foregroundColor(.black)
                    .padding(.leading, 35)
                    .padding(.top, 50)
                    .padding(.trailing)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        CardViews()
                    }
                    
                    HStack{
                        
                        Text("Popular Search")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: SystemImageName.ellipsis)
                                .font(.title)
                            
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.leading, 25)
                    .padding(.top, 25)
                    .padding(.trailing)
                    
                    // MARK: - Popular Search View
                    ScrollView(.horizontal, showsIndicators: false) {
                    PopularSearchViews()
                    }
                    .padding(.top, 25)
                    
                }
                .background(Color.white)
                // acheive outline corner radius (only to topleft)
                // Tail of word balloon
                .clipShape(Corners(corner: [.topLeft], size: CGSize(width: 70, height: 70)))
                
            }
            .padding(.top, -10)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}
