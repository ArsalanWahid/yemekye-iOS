//
//  Menu.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit



class Menu{
    
    //MARK:- Properties
    unowned let resturant: Resturant
    var category: [String]
    var mealItems:[MealItem]
    
    //MARK:- Initializers
    
    //failable initializer
    init(resturant: Resturant ,category: [String] ,mealItems: [MealItem]){
        self.resturant = resturant
        self.category = category
        self.mealItems = mealItems
    }
 
    deinit {
        print("Menu for \(resturant) is deallocated")
    }
    //MARK:- Questions
    
    //how will i tarck menu id ?
    //how will i add items belonging to specific resturant
    
    
}
