//
//  Cities.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

/*sample json
 {
 "location_suggestions": [
 {
 "id": 289,
 "name": "Boston, MA",
 "country_id": 216,
 "country_name": "United States",
 "should_experiment_with": 0,
 "discovery_enabled": 1,
 "has_new_ad_format": 0,
 "is_state": 0,
 "state_id": 87,
 "state_name": "Massachusetts",
 "state_code": "MA"
 }
 */

import ObjectMapper



class CityResponse: Mappable {
    
    //conforming to the json respnse by zomato for cities
    var location_suggestions : [ZomatoCities]?
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        location_suggestions <- map["location_suggestions"]
    }
}


class ZomatoCities : Mappable{
    
    
    var id:Int!
    var name : String!
    var country_id:Int!
    var country_name:String!
    var is_state:Int!
    var state_id:Int!
    var state_name:String!
    var state_code:String!
    var location: String!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        
        id <- map["id"]
        name <- map["name"]
        country_id <- map["country_id"]
        country_name <- map["country_name"]
        is_state <- map["is_state"]
        state_id <- map["state_id"]
        state_name <- map["state_name"]
        state_code <- map["state_code"]
        location <- map["location"]
        
    }
}


