//
//  ViewController.swift
//  routeMapDemo
//
//  Created by AKIL KUMAR THOTA on 3/10/18.
//  Copyright © 2018 AKIL KUMAR THOTA. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        let sourceLocation = CLLocationCoordinate2D(latitude: 40.759011, longitude: -73.984472)
        let destinationLocation = CLLocationCoordinate2D(latitude: 40.748441, longitude: -73.985564)
        showRouteOnMap(pickupCoordinate: sourceLocation, destinationCoordinate: destinationLocation)
    }
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        let cord1 = CLLocationCoordinate2D(latitude: 34.4313, longitude: -118.59890)
        let cord2 = CLLocationCoordinate2D(latitude: 34.4274, longitude: -118.60246)
        let cord3 = CLLocationCoordinate2D(latitude: 34.4268, longitude: -118.60181)
        let cord4 = CLLocationCoordinate2D(latitude: 34.4202, longitude: -118.6004)
        let coords = [cord1,cord2,cord3,cord4]
        let myPolyline = MKPolygon(coordinates: coords, count: coords.count)
        
        myMapView.add(myPolyline)
        let ano1 = MKPointAnnotation()
        ano1.coordinate = cord1
        let ano2 = MKPointAnnotation()
        ano2.coordinate = cord2
        let ano3 = MKPointAnnotation()
        ano3.coordinate = cord3
        let ano4 = MKPointAnnotation()
        ano4.coordinate = cord4
        
        myMapView.addAnnotations([ano1,ano2,ano3,ano4])
        
        //        let directionRequest = MKDirectionsRequest()
        //        directionRequest.source = sourceMapItem
        //        directionRequest.destination = destinationMapItem
        //        directionRequest.transportType = .automobile
        //
        //        // Calculate the direction
        //        let directions = MKDirections(request: directionRequest)
        //
        //        directions.calculate {
        //            (response, error) -> Void in
        //
        //            guard let response = response else {
        //                if let error = error {
        //                    print("Error: \(error)")
        //                }
        //
        //                return
        //            }
        //
        //            let route = response.routes[0]
        //
        //            self.myMapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
        //
        //            let rect = route.polyline.boundingMapRect
        //            self.myMapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        //        }
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolygonRenderer(overlay: overlay)
        
        renderer.strokeColor = UIColor.green
        
        renderer.lineWidth = 5.0
        
        return renderer
    }
}





