//
//  Home.swift
//  AdvanceMapKit (iOS)
//
//  Created by Keunna Lee on 2021/02/09.
//

import SwiftUI

struct Home: View {
    
    @StateObject: var mapData = MapViewModel()
    var body: some View {
        ZStack {
            // MapView
            MapView()
                // using it as environment object so that it can be used ints subviews
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
