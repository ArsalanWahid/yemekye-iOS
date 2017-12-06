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
    var cities:[City]?
    init(name: String) {
        self.name = name
    }
    
    func addCity(name: String){
        self.cities?.append(City(name: name, country: self))
    }
    
    //Added Just one country with cities
    //static let existingCountries = Country(name: "Pakistan",cities: Cities.existingCities)
}
