//
//  Meal.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/8/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class Meal{
//MARK:- Properties
var name: String
var photo: UIImage?
var rating: Int

//The ? means that this is a failable initializer
init?(name: String, photo: UIImage?, rating: Int) {
    
    //Name must not be empty
    guard !name.isEmpty else{
        return nil
    }
    
    //rating should be between 0-5
    guard (rating >= 0) && (rating <= 5) else{
        return nil
    }
    
    self.name = name
    self.photo = photo
    self.rating = rating
    
}
}

