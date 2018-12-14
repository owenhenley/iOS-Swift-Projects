//
//  ViewController.swift
//  CustomPickerView
//
//  Created by Owen Henley on 8/27/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var miles: [Int] {
        var miles: [Int] = []
        for number in 0...99 {
            miles.append(number)
        }
        return miles
    }
    
    var milesFraction: [Double] {
        return [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
    }
    
    var units: [String] {
        return ["Kilometers", "Miles"]
    }
    
    var hours: [Int] {
        var hours: [Int] = []
        for number in 0...23 {
            hours.append(number)
        }
        
        return hours
    }
    
    var minutes: [Int] {
        var minutes: [Int] = []
        for number in 0...59 {
            minutes.append(number)
        }
        
        return minutes
    }
    
    var seconds: [Int] {
        var seconds: [Int] = []
        for number in 0...59 {
            seconds.append(number)
        }
        
        return seconds
    }
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var distancePickerView: UIPickerView!
    
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distancePickerView.delegate = self
        distancePickerView.dataSource = self
        durationPickerView.delegate = self
        durationPickerView.dataSource = self
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 {
            return 3
        } else if pickerView.tag == 2 {
            return 3
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            switch component {
            case 0:
                return miles.count
            case 1:
                return milesFraction.count
            case 2:
                return units.count
            default:
                return 0
            }
        } else if pickerView.tag == 2 {
            switch component {
            case 0:
                return hours.count
            case 1:
                return minutes.count
                
            case 2:
                return seconds.count
            default:
                return 0
            }
        }
        
        return 0
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            switch component {
            case 0:
                return String(miles[row])
            case 1:
                var milesFractionAsString = String(milesFraction[row])
                milesFractionAsString.removeFirst()
                return milesFractionAsString
            case 2:
                return units[row]
            default:
                return ""
            }
        } else if pickerView.tag == 2 {
            switch component {
            case 0:
                var hoursAsString = String(hours[row])
                hoursAsString.append(" h")
                return hoursAsString
            case 1:
                var minsAsString = String(minutes[row])
                minsAsString.append(" m")
                return minsAsString
            case 2:
                var secondsAsString = String(seconds[row])
                secondsAsString.append(" s")
                return secondsAsString
            default:
                return ""
            }
        }
        
        return ""
    }
}
