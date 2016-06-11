//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by stephen batifol on 01/06/16.
//  Copyright © 2016 stephen batifol. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {
 
    var mapView: MKMapView!
    let locationManager = CLLocationManager()

    
    func mapTypeChanged(segControl : UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2 :
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    override func loadView() {
        super.loadView()
        
        mapView = MKMapView()
        view = mapView
        
//        let segmentedControl
//            = UISegmentedControl(items: ["Standard", "Hybrid", "Satelitte"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelitteString = NSLocalizedString("Satelitte", comment: "Satelitte map view")
        
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelitteString])
        
        
        segmentedControl.backgroundColor
            = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
//        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        
        let margins = view.layoutMarginsGuide
        
        
        //Top contrainst is below the status bar
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        
//        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        
//        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        
        //Ask the user for the authorization.
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("Location is enabled")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Mapview is loaded")
    }
    
}
