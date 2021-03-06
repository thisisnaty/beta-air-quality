//
//  AirQualityReport.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/3/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import RxSwift
import class Foundation.NSDictionary

struct AirQualityReport {
	let aqi : Double
	let location : String
	let timestamp : Date
	let dominentPollutant : String
	let pollutants : Dictionary<String,Pollutant>

	// tedious parsing part
	static func parseJSON(_ json: NSDictionary) throws -> AirQualityReport {
		guard let aqi 				= json["aqi"] 			as? Double,
			let dominentPollutant 	= json["dominentpol"] 	as? String,
			let locationJSON 		= json["city"] 			as? [String: Any],
			let location 			= locationJSON["name"]	as? String,
			let pollutantsJSON 		= json["iaqi"] 			as? [String: [String: Double]]
			else {
				throw apiError("Error parsing air quality report")
		}
		
		var pollutants : Dictionary<String,Pollutant> = [
			"pm10" : Pollutant(title: "PM10"),
			"pm25" : Pollutant(title: "PM2.5"),
			"so2"  : Pollutant(title: "SO2"),
			"co"   : Pollutant(title: "CO"),
			"o3"   : Pollutant(title: "O3"),
			"no2"  : Pollutant(title: "NO2")
		]
		
		for string in pollutantsJSON {
			if pollutants.keys.contains(string.key) {
				let pollutant = Pollutant(rawValue: string.value)
				pollutants[string.key]?.aqi = pollutant.aqi
				pollutants[string.key]?.count = pollutant.count
			}
		}
		
		return AirQualityReport(aqi: aqi, location: location, timestamp: Date(), dominentPollutant: dominentPollutant, pollutants: pollutants)
	}
}
