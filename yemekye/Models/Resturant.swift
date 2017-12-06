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
    unowned let city: City
    var menu : Menu
    var timing : [String]
    var resturantImage: UIImage?
    var status: String
    var address: String
    var phoneNumber: String?
    
    
    //The mighty Restuart Object
    //Failable as some parameteres cannot be nil
    init?(name: String, city: City,menu: Menu,timings:[String],resturantImage:UIImage?, status:String, address:String, phonenumber:String) {
        
        
        //Resturant name cannot be nil
        guard !name.isEmpty else {
            return nil
        }
        
        //resturant address cannot be nil
        guard !address.isEmpty else{
            return nil
        }
        
        //Set the Object Properties
        self.name = name
        self.city = city
        self.menu = menu
        self.timing = timings
        self.resturantImage = resturantImage
        self.status = status
        self.address = address
        self.phoneNumber = phonenumber
    }
    
}



