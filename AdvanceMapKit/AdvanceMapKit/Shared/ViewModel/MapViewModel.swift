//
//  MapViewModel.swift
//  AdvanceMapKit (iOS)
//
//  Created by Keunna Lee on 2021/02/09.
//

import SwiftUI
import MapKit

// All map data goes here

class MapViewModel: ObservedObject {
    @Published var mapView = MKMapView()
    
    // region
    @Published var region: MKCoordinateRegion!
    // based on location it will set up
}
