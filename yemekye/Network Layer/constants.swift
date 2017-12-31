//
//  constants.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/31/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//



struct Constants{
    
    // This will be use to contruct the calls to the zomaoAPI
    struct Zomato{
        static let APIBaseURL = "https://developers.zomato.com/api/v2.1/"
    }
    
    struct Method{
        static let cities = "cities"
        static let locations = "locations"
        static let location_details  = "location_details"
    }
    
    
    struct ParametersKeys{
        static let q = "q"
        static let query = "query"
        static let lat = "lat"
        static let lon = "lon"
    }
    
    
    
}
