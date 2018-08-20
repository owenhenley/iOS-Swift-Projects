//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Owen Henley on 8/14/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	let ballArray = ["ball1", "ball2", "ball2","ball3", "ball4", "ball5"]
	
	var randomBallNumber: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		randomBallResult()
	}

	@IBAction func askButtonTapped(_ sender: Any) {
		randomBallResult()
	}
	
	func randomBallResult() {
		randomBallNumber = Int(arc4random_uniform(4))
		imageView.image = UIImage(named: ballArray[randomBallNumber])
	}
	
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		randomBallResult()
	}
}

