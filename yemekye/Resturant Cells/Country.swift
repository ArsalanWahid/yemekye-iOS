//
//  Country.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import Foundation



class Country {
    var name:String
    var cities:[Cities]
    init(name: String,cities: [Cities]) {
        self.name = name
        self.cities = cities
    }
    
    //Added Just one country with cities
    static let existingCountries = Country(name: "Pakistan",cities: Cities.existingCities)
}
