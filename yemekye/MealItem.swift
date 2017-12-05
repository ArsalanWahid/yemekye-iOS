//
//  MealItem.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit


class MealItem{
    
    var name :String
    var photo: UIImage?
    var category: String
    
    //Failable Object Initializer
    init?(name:String, photo: UIImage?, category:String){
        
        guard !name.isEmpty else{
            return nil
        }
        
        guard !category.isEmpty else{
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.category = category
    }
}
