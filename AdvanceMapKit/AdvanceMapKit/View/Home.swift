//
//  Home.swift
//  AdvanceMapKit
//
//  Created by Keunna Lee on 2021/02/09.
//

import SwiftUI
import CoreLocation

struct Home: View {
    
    @StateObject var mapData = MapViewModel()
    // location manager
    @State var locationManager = CLLocationManager()
    var body: some View {
        ZStack {
            MapView()
            // using it as environment object so that it can be used ints subViews...
                .environmentObject(mapData)
            .ignoresSafeArea(.all, edges: .all)
        }
        .onAppear(perform: {
            
            // setting delegate
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
    }
}
