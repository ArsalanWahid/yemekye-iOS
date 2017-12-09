//
//  resturantData.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/9/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//


import UIKit


//MARK:- Singleton
class RData{
    static let Rdata = RData()
    var resturants:[Resturant]
    
    
    let kfc1 = UIImage(named: "krunchburger")
    let kfc2 = UIImage(named:"mightyzinger")
    let kfc3 = UIImage(named:"zinger")
    let kfclogo = UIImage(named: "kfc")

    init() {
        
        guard let mealKFC1 = Meal(name: "Mighty Burger", photo: kfc1, rating: 2) else{
            fatalError("Something bad happened while making meal object")}
        
        guard let mealKFC2 = Meal(name: "Zinger Love", photo: kfc2, rating: 4) else{
            fatalError("Something bad happened while making meal object")
        }
        
        guard let mealKFC3 = Meal(name: "Random Stuff", photo: kfc3, rating: 5) else{
            fatalError("Something bad happened while presenting tasty salad")
        }
        
        let macdonalslogo = UIImage(named: "mcdonalds")
        
        let kfcMenu = Menu(meals: [mealKFC1,mealKFC2,mealKFC3])
        
        
        let KFC = Resturant(name: "Kfc", menu: kfcMenu, timings: ["11am","11pm"], resturantImage: kfclogo!, status: "open", address: "karachi Pakistan", phonenumber: "0511555113",rating: 5)
        
        let KFC1 = Resturant(name: "McDonalds", menu: kfcMenu, timings: ["11am","11pm"], resturantImage: macdonalslogo!, status: "open", address: "karachi Pakistan", phonenumber: "0511555113",rating: 4)
        
        let KFC2 = Resturant(name: "Dominos", menu: kfcMenu, timings: ["11am","11pm"], resturantImage: kfclogo!, status: "open", address: "karachi Pakistan", phonenumber: "0511555113", rating: 4)
        
        let KFC3 = Resturant(name: "Subway", menu: kfcMenu, timings: ["11am","11pm"], resturantImage: kfclogo!, status: "open", address: "karachi Pakistan", phonenumber: "0511555113",rating: 3)
        
        let karachi = City(name: "karachi", resturants: [KFC!])
        
        _ = Country(name: "pakistan", cities: [karachi])
        
        self.resturants = [KFC!,KFC1!,KFC2!,KFC3!]
    }
    
    
}
