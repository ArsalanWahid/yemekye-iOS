//
//  Cities.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit


class City{
    
    var name: String
    var resturants: [Resturant]
    init(name: String,resturants:[Resturant]) {
        self.name = name
        self.resturants = resturants
    }
}
