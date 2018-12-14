//
//  MapViewController.swift
//  mapkit
//
//  Created by Owen Henley on 10/10/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationPin: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let unsignedInRegionInMeters: Double = 500
    var previousLocation: CLLocation?
    var directionsArray: [MKDirections] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        setupLocationManager()
    }
    
        // MARK: - Actions
    
    @IBAction func goButtonTapped(_ sender: Any) {
        getDirections()
    }
    
    
    func setupLocationManager() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // Set the default view for none signed in users.
    func centerViewOnNonAuthUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: unsignedInRegionInMeters, longitudinalMeters: unsignedInRegionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    // Check the devices location settings
    func checkLocationServices() {
        // If device location services are ON
        if CLLocationManager.locationServicesEnabled() {
            //Set up location manager
            setupLocationManager()
            checkLocationAuth()
        } else {
            // Show alert to user to turn location services on
        }
    }
    
    
    func checkLocationAuth() {
        switch CLLocationManager.authorizationStatus() {
        case . authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            // Show alert instructions
            break
        case .notDetermined:
            // Show location request alert
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show alert letting them know whats up
            break
        case .authorizedAlways:
            break
        }
    }
    
    
    func startTrackingUserLocation() {
        //Do map stuff
        mapView.showsUserLocation = true
        // Zoom into map
        centerViewOnNonAuthUserLocation()
        // Track current location
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        // Create a location from the lat' and long'
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func getDirections() {
        
        guard let location = locationManager.location?.coordinate else {
            //error
            return
        }
        
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
        directions.calculate { (response, error) in
            if let error = error {
                 debugPrint("❌ Error in file \(#file), function \(#function), \(error),\(error.localizedDescription)❌")
                return
            }
            
            guard let response = response else { return }
            
            for route in response.routes {
                // add the blue road direction line
                self.mapView.addOverlay(route.polyline)
                // resize the size of the map to fit the directions
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    // Setup Car directions and return a directions request
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        
        // set the destination as the center of the map
        let destinationCoordinate = getCenterLocation(for: mapView).coordinate
        // set where to start from
        let startingLocation = MKPlacemark(coordinate: coordinate)
        // set the destination
        let destination = MKPlacemark(coordinate: destinationCoordinate)
        
        // Request directions
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    func resetMapView(withNew directions: MKDirections) {
        mapView.removeOverlays(mapView.overlays)
        directionsArray.append(directions)
        let _ = directionsArray.map { $0.cancel() }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // Check the last location
//        guard let location = locations.last else { return }
//        // set the center
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        // Set the region
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: unsignedInRegionInMeters, longitudinalMeters: unsignedInRegionInMeters)
//        // Set region
//        mapView.setRegion(region, animated: true)
//    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuth()
    }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        
        // Check to see if the pin moved enough
        guard center.distance(from: previousLocation) > 50 else { return }
        // Set the previous location as the center
        self.previousLocation = center
        
        // Get address based on the centre of the map
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                print("error with reverse geocode: \(error.localizedDescription)")
                #warning("Show alert informing the user")
                return
            }
            
            guard let placemark = placemarks?.first else {
                #warning("Show alert informing the user")
                return
            }
            
            let streetNumber = placemark.subThoroughfare ?? "number"
            let streetName = placemark.thoroughfare ?? "street"
            
            DispatchQueue.main.async {
                self.addressLabel.text = "\(streetNumber) \(streetName)"
            }
        }
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 2
        
        return renderer
    }
}


