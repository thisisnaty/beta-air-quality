//
//  AirQualityReportConfig.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/4/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift

struct Coordinate {
	static let sharedCoordinate = Coordinate() // Singleton
	let variable = Variable<CLLocationCoordinate2D>(CLLocationCoordinate2D())
	var observable:Observable<CLLocationCoordinate2D> {
		return variable.asObservable()
	}
	func set(coordinate: CLLocationCoordinate2D) {
		variable.value = coordinate
	}
}
