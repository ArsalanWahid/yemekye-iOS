//
//  ResturantResponse.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 1/2/18.
//  Copyright © 2018 Arsalan Wahid Asghar. All rights reserved.
//

import ObjectMapper



/** Response mapped on main json

 
 "cuisines": "Pizza, Italian",
 "average_cost_for_two": 60,
 "price_range": 4,
 "currency": "$",
 "name": "Otto Enoteca & Pizzeria",
 "url": "https://www.zomato.com/new-york-city/otto-enoteca-pizzeria-greenwich-village?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
 
 */

//MARK:- Resturant Response from API
class ResturantResponse: Mappable{
    
    var name : String!
    var url:String!
    var location : ResturantLocation!
    var thumb: String!
    var user_rating: UserRating!
    var featured_image:String!
    var phone_numbers: String!
    var average_cost_for_two:Int!
    var currency: String!
    var cusines:String!
    
    //put resturantdata to be captured here .......
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
        location <- map["location"]
        thumb <- map["thumb"]
        user_rating <- map["user_rating"]
        featured_image <- map["featured_image"]
        phone_numbers <- map["phone_numbers"]
        average_cost_for_two <- map["average_cost_for_two"]
        currency <- map["currency"]
        cusines <- map["cuisines"]
        
    }
}





//MARK:- Nested Resturant Location
class ResturantLocation: Mappable {
    
    var address: String!
    var locality:String!
    var city:String!
    var locality_verbose:String!
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        address <- map["address"]
        locality <- map["locality"]
        city <- map["city"]
        locality_verbose <- map["locality_verbose"]
        
        
        
        
    }
}


//MARK:-Nested UserRating
class UserRating:Mappable{
    var aggregate_rating: String!
    var rating_text:String!
    var votes:String!
    var rating_color:String!
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        aggregate_rating <- map["aggregate_rating"]
        rating_text <- map["rating_text"]
        votes <- map["votes"]
        rating_color <- map["rating_color"]
    }
    
}


