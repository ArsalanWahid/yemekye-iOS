//
//  Country.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
class Country {
    var name:String
    var cities:[City]
    
    
    init(name: String , cities: [City]) {
        self.name = name
        self.cities = cities
    }
}
