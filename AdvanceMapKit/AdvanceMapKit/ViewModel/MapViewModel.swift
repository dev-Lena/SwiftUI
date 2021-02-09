//
//  MapViewModel.swift
//  AdvanceMapKit
//
//  Created by Keunna Lee on 2021/02/09.
//

import SwiftUI
import MapKit
import CoreLocation

// All Map Data Goes Here...

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var mapView = MKMapView()
    
    // region ...
    @Published var region: MKCoordinateRegion!
    // based on location it will set up
    
    // alert
    @Published var permissionDenied = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // checking permission
        switch manager.authorizationStatus {
        case .denied: permissionDenied.toggle()
        case .notDetermined: manager.requestWhenInUseAuthorization()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // error
        print(error.localizedDescription)
    }
}
