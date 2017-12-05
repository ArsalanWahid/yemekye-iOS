//
//  Resturant.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit


class Resturant{
    
    var name :String
    var locationsOpen: [Country]
    var menu : [Menu]
    var timings : [String]
    var resturantImage: UIImage?
    var status: String
    var address: String
    var phoneNumber: String?
    
    
    //The mighty Restuart Object
    //Failable as some parameteres cannot be nil
    init?(name: String, locationOpen: [Country],menu: [Menu],timings:[String],resturantImage:UIImage?, status:String, address:String, phonenumber:String) {
        
        
        //Resturant name cannot be nil
        guard !name.isEmpty else {
            return nil
        }
        
        //resturant address cannot be nil
        guard !address.isEmpty else{
            return nil
        }
        
        
        self.name = name
        self.locationsOpen = locationOpen
        self.menu = menu
        self.timings = timings
        self.resturantImage = resturantImage
        self.status = status
        self.address = address
        self.phoneNumber = phonenumber
    }
    
}



