//
//  CircularProgressRing.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/4/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import Foundation
import UICircularProgressRing

extension HomeViewController {
	func setupProgressRing() {
		//values
		ringView.minValue = 0
		ringView.maxValue = 300
		
		//colors
		let green = UIColor.green
		let yellow = UIColor.yellow
		let red = UIColor.red
		ringView.ringStyle = .gradient
		ringView.gradientColors = [green, yellow, red]
		ringView.gradientColorLocations = [0, 0.5, 1]
		ringView.gradientStartPosition = UICircularProgressRingGradientPosition.left
		ringView.gradientEndPosition = UICircularProgressRingGradientPosition.top
		
		//default value
		ringView.value = 0
	}
}
