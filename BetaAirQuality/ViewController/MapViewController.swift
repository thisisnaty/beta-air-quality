//
//  ViewController.swift
//  BetaAirQuality
//
//  Created by Natalia García on 6/27/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class MapViewController: UIViewController {
	let locationManager = CLLocationManager()
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var selectCoordinateButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.mapLongPress(_:))) // colon needs to pass through info
		//add gesture recognition
		mapView.addGestureRecognizer(longPress)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupGeoLocation()
	}
	
	func setupGeoLocation() {
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		locationManager.requestLocation()
	}
	
	@objc func mapLongPress(_ recognizer: UIGestureRecognizer) {
		let touchedAt = recognizer.location(in: self.mapView) // adds the location on the view it was pressed
		let touchedAtCoordinate : CLLocationCoordinate2D = mapView.convert(touchedAt, toCoordinateFrom: self.mapView) // will get coordinates
		
		addPinWithCoordinate(coordinate: touchedAtCoordinate)
	}
	
	func addPinWithCoordinate(coordinate: CLLocationCoordinate2D) {
		let newPin = MKPointAnnotation()
		newPin.coordinate = coordinate
		if(mapView.annotations.count > 0) {
			mapView.removeAnnotations(mapView.annotations)
		}
		mapView.addAnnotation(newPin)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}

extension MapViewController : CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		if status == .authorizedWhenInUse {
			locationManager.requestLocation()
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.first {
			let span = MKCoordinateSpanMake(0.05, 0.05)
			let region = MKCoordinateRegion(center: location.coordinate, span: span)
			mapView.setRegion(region, animated: true)
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("error:: \(error)")
	}
}
