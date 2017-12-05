//
//  Cities.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit


class Cities{
    
    var name: String
    init(name: String) {
        self.name = name
        
    }
    
    //added two cities predefault
    static let existingCities: [Cities] = [Cities(name: "Karachi"), Cities(name: "Lahore")]
    
}
