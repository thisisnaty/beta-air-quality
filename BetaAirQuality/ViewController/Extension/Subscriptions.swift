//
//  APISubscription.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/4/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import RxCocoa
import RxSwift

extension HomeViewController {
	func setupAPISubscription() {
		let AirQualityAPI = DefaultAirQualityAPI.sharedAPI
		
		let _ = callApiButton.rx.tap
			.map { AirQualityAPI.report((self.locationManager.location?.coordinate)!) }
			.concat()
			.map { $0.aqi }
			.bind(onNext: { (aqi) in
				self.aqiLabel.text = String(Int(aqi))
				self.ringView.startProgress(to: CGFloat(aqi), duration: 1)
			})
	}
	
	func setupCoordinateSubscription() {
		let AirQualityAPI = DefaultAirQualityAPI.sharedAPI
		let _ = Coordinate.sharedCoordinate.observable.map{ coord in AirQualityAPI.report(coord) }
			.concat()
			.map { $0.aqi }
			.bind(onNext: { (aqi) in
				self.setAQIMeter(aqi: aqi)
			})
	}
	
	func setAQIMeter(aqi: Double) {
		self.aqiLabel.text = String(Int(aqi))
		let aqiProgress: CGFloat
		if(aqi > 300.0) {
			aqiProgress = 300.0
		}
		else {
			aqiProgress = CGFloat(aqi)
		}
		self.ringView.startProgress(to: aqiProgress, duration: 1)
	}
}

extension MapViewController {
	func setupAPISubscription() {
		let _ = selectCoordinateButton.rx.tap
			.map { _ in
				Coordinate.sharedCoordinate.set(coordinate: self.pointAnnotation.coordinate) }
			.bind(onNext: { (aqi) in
				self.selectCoordinateButton.isEnabled = false
				self.selectCoordinateButton.alpha = 0.0
				let pageViewController = self.parent as! PageViewController
				pageViewController.prevPage()
			})
	}
}
