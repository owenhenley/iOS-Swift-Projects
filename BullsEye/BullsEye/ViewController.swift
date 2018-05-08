//
//  ViewController.swift
//  BullsEye
//
//  Created by Owen Henley on 4/29/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentValue:Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue  = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    // Hit Me Button
    @IBAction func showAlert() {
        let message = "The value of the slider is:\(currentValue)" + "\nThe target value is: \(targetValue)"
		
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction (title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
        updateLabels()
    }
	
    @IBAction func sliderMoved(_ slider:UISlider) {
        currentValue = lroundf(slider.value)
    }
}

