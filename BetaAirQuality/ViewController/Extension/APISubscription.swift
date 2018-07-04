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
}
