//
//  File.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/3/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import CoreLocation
import Foundation

struct Request {
	enum Status: String {
		case Loading, Error, Ready
	}
}

let AQToken = APIKeys.airQuality

func apiError(_ error: String) -> NSError {
	return NSError(domain: "AirQualityAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: error])
}

func exampleError(_ error: String, location: String = "\(#file):\(#line)") -> NSError {
	return NSError(domain: "ExampleError", code: -1, userInfo: [NSLocalizedDescriptionKey: "\(location): \(error)"])
}

let defaultCoordinates = CLLocationCoordinate2D(latitude: 40.508432, longitude: -74.8687513)
