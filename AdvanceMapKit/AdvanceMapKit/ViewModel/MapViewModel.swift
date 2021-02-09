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
    
    // map type
    @Published var mapType: MKMapType = .standard
    
    // updating map type
    
    func updateMapType() {
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // checking permission
        switch manager.authorizationStatus {
        case .denied: permissionDenied.toggle()
        case .notDetermined: manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            // if permission given
            manager.requestLocation()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // error
        print(error.localizedDescription)
    }
    
    // getting user region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        // updating map
        self.mapView.setRegion(self.region, animated: true)
        
        // smooth animations
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
