////
////  data.swift
////  yemekye
////
////  Created by Arsalan Wahid Asghar on 12/6/17.
////  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
////
//import UIKit
//
//class Data {
//    
//    static let data = Data()
//    
//    private var countryNames = [String]()
//    var countries = [Country]()
//   
//    
////
////    private func initializeCountries(_ countries:[String]){
////
////        for n in countries{
////            var country = Country(name: n)
////            self.countries.append(country)
////        }
////        print("Total Countries in the App \(countries)")
////    }
//    
//    
//    fileprivate init(){
//        // Read plist from bundle and get Root Dictionary out of it
//        var dictRoot: NSDictionary?
//        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
//            dictRoot = NSDictionary(contentsOfFile: path)
//        }
//        
//        if let dict = dictRoot
//        {
//            // Your dictionary contains an array of dictionary
//            // Now pull an Array out of it.
//            var countryList:[NSDictionary] = dictRoot?["Countries"] as! Array
//            // Now a loop through Array to fetch single Item from catList which is Dictionary
//            countryList.forEach({
//                (dict) in
//                
//                let country = Country(name: dict["Name"]! as! String)
////                print("Country Name \(dict["Name"]!)")
////                self.countryNames += [dict["Name"]! as! String]
////                print("This is being printed by country names \(countries)")
////                for n in countries{
////                    var country = Country(name: n)
////                    self.countries.append(country)
////                }
//            
//                var cityList:[NSDictionary] = dict["Cities"] as! Array
//                
//                cityList.forEach({
//                    (dict) in
////                    print("City Name \(dict["Name"]!)")
//                    country.addCity(name: dict["Name"]! as! String)
//                    var RestuarntList:[NSDictionary] = dict["Restaurants"] as! Array
//                    RestuarntList.forEach({
//                        (dict) in
//                        print("Resturant Name \(dict["Name"]!)")
//                    })
//                    
//                })
//            })
//        }
//    }
//}
//
//
//
