//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Owen Henley on 5/25/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botChoice: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var goAgain: UIButton!
    
    @IBAction func rockPress(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func paperPress(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorsPress(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func goAgainPress(_ sender: Any) {
        resetGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    func play(_ playerChoice: Sign) {
        rock.isHidden = true
        rock.isEnabled = false
        paper.isHidden = true
        paper.isEnabled = false
        scissors.isHidden = true
        scissors.isEnabled = false
        
        let opponant = randomSign()
        botChoice.text = opponant.emoji
        
        let gameResult = playerChoice.takeTurn(opponant)
        
        switch gameResult {
        case .draw:
            gameStatus.text = "Its a Draw!"
        case .lose:
            gameStatus.text = "You Lose!"
        case .win:
            gameStatus.text = "You Win!"
        case .start:
            gameStatus.text = "Rock, Paper or Scissors?"
            }
        
        switch playerChoice {
        case .rock:
            rock.isHidden = false
            paper.isHidden = true
            scissors.isHidden = true
        case .paper:
            rock.isHidden = true
            paper.isHidden = false
            scissors.isHidden = true
        case .scissors:
            rock.isHidden = true
            paper.isHidden = true
            scissors.isHidden = false
        }
        goAgain.isHidden = false
    }
    
    func resetGame() {
        botChoice.text = "🤖"
        gameStatus.text = "Rock, Paper or Scissors?"
        goAgain.isHidden = true
        rock.isHidden = false
        rock.isEnabled = true
        paper.isHidden = false
        paper.isEnabled = true
        scissors.isHidden = false
        scissors.isEnabled = true
        let transition = CATransition()
        transition.type = kCATransition
        transition.duration = 0.5
    }
}

