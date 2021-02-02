//
//  Home.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/02.
//

import SwiftUI

struct Home: View {
    var body: some View {
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
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}
