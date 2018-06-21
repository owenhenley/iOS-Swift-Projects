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
        setTipCalculationValues()
        updateUI()
    }
    
    func setTipCalculationValues() {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString) .doubleValue
        tip.calculateTip()
    }
    
    func updateUI() {
        tipLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentage.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
    }
    
    
    //MARK: IBActions
    
    @IBAction func billAmountChanged(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func tipChanged(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }
    
    
}

