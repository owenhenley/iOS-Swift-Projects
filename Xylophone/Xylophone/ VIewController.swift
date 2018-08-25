//
//  ViewController.swift
//  Xylophone
//
//  Created by Owen Henley on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
	
	//Properties
	var audioPlayer: AVAudioPlayer!
	var selectedFileName = ""
	let notes = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// Actions
    @IBAction func notePressed(_ sender: UIButton) {
		
		selectedFileName = notes[sender.tag - 1]
		
		playSound()
    }
	
	func playSound() {
		
		let soundURL = Bundle.main.url(forResource: selectedFileName, withExtension: "wav")
		
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
		} catch {
			print(error.localizedDescription)
		}
		audioPlayer.play()
	}
}

