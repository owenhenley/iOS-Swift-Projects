//
//  TipModel.swift
//  TipsyCalcApp
//
//  Created by Owen Henley on 6/19/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation

class TipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
            }
        }
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    var tipAmount: Double {
            return _tipAmount
        }
    var totalAmount: Double {
        return _totalAmount
    }
    
    init(billAmount: Double, tipPercent: Double) {
        self.billAmount = billAmount
        self.tipPercent = tipPercent
    }
    
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
    
    
    
}
