//
//  Pollutant.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/3/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import Foundation

struct Pollutant {
	var aqi : Double = 0.0
	var count : Int = 0
	var title : String = ""
	init(title : String) {
		self.title = title
	}
	init(rawValue : [String: Any]) {
		self.aqi = (rawValue["v"] as? Double)!
		self.count = Int(ceil(self.aqi) * 1.5)
	}
}
