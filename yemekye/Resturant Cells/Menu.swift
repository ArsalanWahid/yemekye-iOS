//
//  Menu.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit



class Menu {
    
    //MARK:- Properties
    var resturant: Resturant
    var category: [String]
    var mealItems:[MealItem]
    
    //MARK:- Initializers
    
    //failable initializer
    init?(resturant: Resturant, category: [String] ,mealItems: [MealItem]){
        self.resturant = resturant
        self.category = category
        self.mealItems = mealItems
    }
 
    //MARK:- Questions
    
    //how will i tarck menu id ?
    //how will i add items belonging to specific resturant
    
    
}
