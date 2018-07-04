//
//  Actions.swift
//  BetaAirQuality
//
//  Created by Natalia García on 7/4/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import Foundation

extension HomeViewController {
	@IBAction func selectLocationButtonAction(_ sender: Any){
		let pageViewController = self.parent as! PageViewController
		pageViewController.nextPage()
	}
}
