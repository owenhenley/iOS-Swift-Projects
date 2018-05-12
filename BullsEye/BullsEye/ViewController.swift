//
//  ViewController.swift
//  BullsEye
//
//  Created by Owen Henley on 4/29/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

// target value


import UIKit
import QuartzCore

class ViewController: UIViewController {
    var score = 0
    var round = 0
    var currentValue = 0
    var targetValue = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
                        trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizeable =
                        trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue) // abs - If whatever is inside paranthases is a negative, will be made positive
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!" + "\n100 Bonus Points!"
            points += 100
        } else if difference < 5 {
            title = "So close!" + "\n20 Bonus Points!"
            points += 20
        } else if difference < 10 {
            title = "Close, but no cigar..."
        } else {
            title = "Not even close...🤦‍♂️"
            points = 0
        }
        score += points // Score = score + points
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: { action in
                                self.startNewRound()
                                self.updateLabels()
                            })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    func startNewRound() {
        round += 1 // increments the round 1 by 1 every time its called
        targetValue = 1 + Int(arc4random_uniform(100)) // randomises the target value
        currentValue = 50 // resets the slider to the centre
        slider.value = Float(currentValue)  // sets the value to a float
        let transition = CATransition()
        transition.type = kCATransitionFade // in transition, choose type xxx
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func startNewGame() {
        score = 0 // resets score and round
        round = 0
        startNewRound() //calls for a new round from the above function
    }
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

