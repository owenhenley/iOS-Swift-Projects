//
//  ViewController.swift
//  Food Tracker
//
//  Created by Owen Henley on 6/23/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Outlet
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealTextField: UITextField!
    
    //MARK: Action
    @IBAction func setDefaultText(_ sender: UIButton) {
        mealName.text = "Meal Name"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //Hide Keyboard
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealName.text = textField.text
    }

   
}

