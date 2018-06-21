//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by Owen Henley on 6/18/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    
    @IBAction func billAmountChanged(_ sender: Any) {
        print("My Value Changed!")
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        print(tipPercentageSlider.value)
    }
    
    
}

