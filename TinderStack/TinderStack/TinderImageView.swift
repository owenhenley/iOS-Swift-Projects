//
//  TinderImageView.swift
//  TinderStack
//
//  Created by Owen Henley on 6/16/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class TinderImageView: UIImageView {
    
    
    
    @IBInspectable
    var imageIndex: NSNumber! {
        didSet {
            print(imageIndex)
            let imageName = "Alicia\(imageIndex.stringValue)"
            self.image = UIImage(named: imageName)
            
            layer.cornerRadius = 7
        }
    }
}
