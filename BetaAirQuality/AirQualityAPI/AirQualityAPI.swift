//
//  AirQualityViewModel.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/2/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import CoreLocation
import Foundation
import RxSwift
import RxCocoa

protocol AirQualityAPI {
	func report(_ coordinates: CLLocationCoordinate2D) -> Observable<AirQualityReport>
}

class DefaultAirQualityAPI {
	static let sharedAPI = DefaultAirQualityAPI() // Singleton
	
	private func JSON(_ url: URL) -> Observable<Any> {
		return URLSession.shared.rx.json(url: url)
	}

	func report(_ coordinates: CLLocationCoordinate2D) -> Observable<AirQualityReport> {
		let escapedCoordinates = "\(coordinates.latitude);\(coordinates.longitude)"
		guard let url = URL(string: "https://api.waqi.info/feed/geo:\(escapedCoordinates)/?token=\(AQToken)") else {
			return Observable.error(apiError("Can't create url"))
		}
		
		return JSON(url)
			.map { jsonResult in
					guard let json = jsonResult as? NSDictionary else {
						throw exampleError("Parsing error")
					}
				
					guard let jsonData = json.value(forKey: "data") as? NSDictionary else {
						throw exampleError("Error getting data")
					}
				
					return try AirQualityReport.parseJSON(jsonData
					)
			}
			.retry(2)
			.observeOn(MainScheduler.instance)
	}
}
