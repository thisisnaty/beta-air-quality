//
//  GeoLocation.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/4/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import CoreLocation

extension HomeViewController {
	func setupGeoLocation() {
		locationManager = CLLocationManager()
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestAlwaysAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			locationManager.startUpdatingLocation()
		}
	}
}
