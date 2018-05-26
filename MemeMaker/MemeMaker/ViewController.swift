//
//  ViewController.swift
//  MemeMaker
//
//  Created by Owen Henley on 5/26/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func segmentedControl(_ sender: Any) {
        updateLabels()
    }
    
    var topChoices = [CaptionChoice]()
    var bottomChoices = [CaptionChoice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coolChoice = CaptionChoice(emoji: "😎", caption: "You know whats cool?")
        let madChoice = CaptionChoice(emoji: "😡", caption: "You know what makes me mad?")
        let loveChoice = CaptionChoice(emoji: "💞", caption: "You know what I love?")
        let catChoice = CaptionChoice(emoji: "😸", caption: "Cats wearing hats!")
        let dogChoice = CaptionChoice(emoji: "🐶", caption: "Dogs carrying logs!")
        let monkeyChoice = CaptionChoice(emoji: "🐒", caption: "Monkeys being funkey!")
        
        topChoices = [coolChoice, madChoice, loveChoice]
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomChoices = [catChoice, dogChoice, monkeyChoice]
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: true)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        updateLabels()
    }
    
    func updateLabels() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        topCaptionLabel.text = topChoice.caption
        bottomCaptionLabel.text = bottomChoice.caption
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

