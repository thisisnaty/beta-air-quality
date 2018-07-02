//
//  ViewController.swift
//  BetaAirQuality
//
//  Created by Natalia García on 6/27/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
	
	@IBOutlet weak var apiResponseLabel: UILabel!
	
	let disposeBag = DisposeBag()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

