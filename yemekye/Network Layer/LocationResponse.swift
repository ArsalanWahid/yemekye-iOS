//
//  LocationResponse.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/31/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import ObjectMapper



class LocationResponse: Mappable{
    
    //conforming to the json respnse by zomato for cities
    var location_suggestions : [Locations]?
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        location_suggestions <- map["location_suggestions"]
    }
}
    
    
    
    
class Locations: Mappable{
    
    var entity_type: String!
    var entity_id: Int!
    var title: String!
    var latitude: Double!
    var longitude: Double!
    var city_id: Int!
    var city_name: String!
    var country_id: Int!
    var country_name: String!
    required init?(map: Map){
        
    }
    
    
    func mapping(map: Map){
        
        entity_type <- map["entity_type"]
        entity_id   <- map["entity_id"]
        title <- map["title"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        city_id <- map["city_id"]
        city_name <- map["city_name"]
        country_id <- map["country_id"]
        country_name <- map["country_name"]
        
    }
    
}
 
