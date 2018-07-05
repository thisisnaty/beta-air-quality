//
//  ViewController.swift
//  BetaAirQuality
//
//  Created by Natalia García on 6/27/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import UICircularProgressRing
import CoreLocation
import UIKit
import RxSwift

class HomeViewController: UIViewController {
	@IBOutlet weak var callApiButton: UIButton!
	@IBOutlet weak var aqiLabel: UILabel!
	@IBOutlet weak var ringView: UICircularProgressRing!
	
	let disposeBag = DisposeBag()
	var locationManager: CLLocationManager!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupProgressRing()
		setupAPISubscription()
		setupCoordinateSubscription()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupGeoLocation()
	}
	
	@IBAction func callApiButtonTapped(_ sender: AnyObject) {
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

