//
//  meal.swift
//  Food Tracker
//
//  Created by Owen Henley on 6/27/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Proeprties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialize
    init?(name: String, photo: UIImage?, rating: Int) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
