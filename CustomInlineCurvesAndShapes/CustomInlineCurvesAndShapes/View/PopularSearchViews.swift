//
//  PopularSearchViews.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/03.
//

import SwiftUI

struct PopularSearchViews: View {
    
    @State var index = 0
    
    var body: some View {
            
            HStack(spacing: 25){
                
                VStack(spacing: 10){
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 15){
                            
                            Text("UI/UX")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("Designer")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("4 Job Oppournity")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 25)
                    .padding(.leading, 25)
                }
                // setting custom width
                .padding(.bottom, 20)
                .frame(width: UIScreen.main.bounds.width / 2)
                .background(self.index == 0 ? Color(AssetName.select) : Color.black.opacity(0.06))
                .cornerRadius(35)
                .onTapGesture {
                    
                    self.index = 0
                }
                
                VStack(spacing: 10){
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 15){
                            
                            Text("iOS")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("Developers")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("15 Job Oppournity")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 25)
                    .padding(.leading, 25)
                }
                // setting custom width
                .padding(.bottom, 20)
                .frame(width: UIScreen.main.bounds.width / 2)
                .background(self.index == 1 ? Color("select") : Color.black.opacity(0.06))
                .cornerRadius(35)
                .onTapGesture {
                    
                    self.index = 1
                }
            }
            .padding(.horizontal, 25)
    }
}
