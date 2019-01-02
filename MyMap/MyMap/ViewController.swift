//
//  ViewController.swift
//  MyMap
//
//  Created by Yutaka Okubo on 2019/01/02.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        if (CLLocationManager.authorizationStatus() != .authorizedWhenInUse) {
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse) {
            manager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locations : \(locations)")
        let current = locations[0]
        let region = MKCoordinateRegion.init(center: current.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error = \(error)")
    }
}
