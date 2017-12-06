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
    unowned let country: Country
    var resturants = [Resturant]()
   //lblShowOutput.text = "Username: \(theUser.username!)\nPassword: \(theUser.password!)" var resturants:[Resturant]
    init(name: String, country:Country) {
        self.name = name
        self.country = country
    }
    
    func addResturant(name: String,menu: Menu, timings: String, image:UIImage? ,stat:String , address:String, phone:String){
        self.resturants.append(Resturant(name: name, city: self, menu: menu, timings: [timings], resturantImage: image, status: stat, address: address, phonenumber: phone)!)
    }
    
}
