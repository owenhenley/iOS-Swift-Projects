//
//  ViewController.swift
//  Dicee
//
//  Created by Owen Henley on 8/14/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var randomDiceIndex1: Int = 0
	var randomDiceIndex2: Int = 0
	
	let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

	@IBOutlet weak var diceImage1: UIImageView!
	@IBOutlet weak var diceImage2: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		randomDiceRoll()
	}
	
	@IBAction func rollButton(_ sender: Any) {
		randomDiceRoll()
	}
	
	func randomDiceRoll() {
		randomDiceIndex1 = Int(arc4random_uniform(6))
		randomDiceIndex2 = Int(arc4random_uniform(6))
		
		diceImage1.image = UIImage(named: diceArray[randomDiceIndex1])
		diceImage2.image = UIImage(named: diceArray[randomDiceIndex2])
	}
	
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		randomDiceRoll()
	}
}

