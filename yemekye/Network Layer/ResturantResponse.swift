//
//  ResturantResponse.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 1/2/18.
//  Copyright © 2018 Arsalan Wahid Asghar. All rights reserved.
//

import ObjectMapper


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

//DONE
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


//DONE
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



//{
//"R": {
//  "res_id": 6114148
// },
//"apikey": "876ed9466d61c57c3d172f5a2e95d838",
//"id": "6114148",
//"name": "OXO Tower Restaurant",
//"url": "https://www.zomato.com/london/oxo-tower-restaurant-south-bank?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
//  "location": {
//"address": "OXO Tower Wharf, Barge House Street, South Bank, London SE1 9PH",
//"locality": "Barge House Street, South Bank",
//"city": "London",
//"city_id": 61,
// "latitude": "51.5083890000",
//"longitude": "-0.1082060000",
//"zipcode": "SE1 9PH",
//"country_id": 215,
//  "locality_verbose": "Barge House Street, South Bank, London"
//},
//"switch_to_order_menu": 0,
//"cuisines": "Modern European, British",
//"average_cost_for_two": 100,
//"price_range": 4,
//"currency": "£",
//"offers": [],
//"zomato_events": [
//{
//"event": {
//"event_id": 93010,
//"friendly_start_date": "13 December, 2017",
//"friendly_end_date": "14 February",
//"start_date": "2017-12-13",
//"end_date": "2018-02-14",
//"end_time": "23:00:00",
//"start_time": "12:00:00",
//"is_active": 1,
//"date_added": "2016-12-08 18:08:35",
//"photos": [
//{
//"photo": {
//"url": "https://b.zmtcdn.com/data/zomato_events/photos/671/9438b68783c4d36d4a722f945051f671_1481200716.jpg",
//"thumb_url": "https://b.zmtcdn.com/data/zomato_events/photos/671/9438b68783c4d36d4a722f945051f671_1481200716.jpg?fit=around%7C100%3A100&crop=100%3A100%3B%2A%2C%2A",
//"order": 0,
//"md5sum": "9438b68783c4d36d4a722f945051f671",
//"photo_id": 152329,
//"uuid": 1481200616707382,
//"type": "NORMAL"
//}
//},
//{
//"photo": {
//"url": "https://b.zmtcdn.com/data/zomato_events/photos/090/f5d3e80150be2c96b8017dd23e41c090_1481200717.jpg",
//"thumb_url": "https://b.zmtcdn.com/data/zomato_events/photos/090/f5d3e80150be2c96b8017dd23e41c090_1481200717.jpg?fit=around%7C100%3A100&crop=100%3A100%3B%2A%2C%2A",
//"order": 1,
//"md5sum": "f5d3e80150be2c96b8017dd23e41c090",
//"photo_id": 152330,
//"uuid": 1481200647249813,
//"type": "NORMAL"
//}
//},
//{
//"photo": {
//"url": "https://b.zmtcdn.com/data/zomato_events/photos/39a/35a6950ffb9e8b03e1864b1c29fbf39a_1481200717.jpg",
//"thumb_url": "https://b.zmtcdn.com/data/zomato_events/photos/39a/35a6950ffb9e8b03e1864b1c29fbf39a_1481200717.jpg?fit=around%7C100%3A100&crop=100%3A100%3B%2A%2C%2A",
//"order": 2,
//"md5sum": "35a6950ffb9e8b03e1864b1c29fbf39a",
//"photo_id": 152331,
//"uuid": 1481200647739817,
//"type": "NORMAL"
//}
//},
//{
//"photo": {
//"url": "https://b.zmtcdn.com/data/zomato_events/photos/307/6bd46d6b5f0b7d3373438283b0bfd307_1481200717.jpg",
//"thumb_url": "https://b.zmtcdn.com/data/zomato_events/photos/307/6bd46d6b5f0b7d3373438283b0bfd307_1481200717.jpg?fit=around%7C100%3A100&crop=100%3A100%3B%2A%2C%2A",
//"order": 3,
//"md5sum": "6bd46d6b5f0b7d3373438283b0bfd307",
//"photo_id": 152332,
//"uuid": 1481200648947364,
//"type": "NORMAL"
//}
//},
//{
//"photo": {
//"url": "https://b.zmtcdn.com/data/zomato_events/photos/eaf/fbbfcfb885c14f68e2ad741e5b580eaf_1486122718.jpg",
//"thumb_url": "https://b.zmtcdn.com/data/zomato_events/photos/eaf/fbbfcfb885c14f68e2ad741e5b580eaf_1486122718.jpg?fit=around%7C100%3A100&crop=100%3A100%3B%2A%2C%2A",
//"order": 4,
//"md5sum": "fbbfcfb885c14f68e2ad741e5b580eaf",
//"photo_id": 168611,
//"uuid": 1486122713378606,
//"type": "NORMAL"
//}
//}
//],
//"restaurants": [],
//"is_valid": 1,
//"share_url": "http://www.zoma.to/r/6114148",
//"title": "Valentine's Day",
//"description": "Head to OXO on 14 February and treat that someone special to a delicious dinner with the sparkling London skyline as your backdrop.  The OXO Tower Restaurant will be offering a special set menu for those in the mood for romancing on Valentine’s Day. Enjoy a specially-prepared three course menu with a bottle of Champagne included for £140, all with live music to entertain you in the background as you dine.",
//"display_time": "12:00 pm - 11:00 pm",
//"display_date": "13 December - 14 February",
//"is_end_time_set": 1,
//"disclaimer": "Restaurants are solely responsible for the service; availability and quality of the events including all or any cancellations/ modifications/ complaints.",
//"event_category": 0,
//"event_category_name": "",
//"book_link": ""
//}
//}
//],
//"thumb": "https://b.zmtcdn.com/data/res_imagery/6114148_RESTAURANT_b19c2e9df6e025c836244a2f8d52afb7.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A",
//"user_rating": {
//    "aggregate_rating": "4.2",
//    "rating_text": "Very Good",
//    "rating_color": "5BA829",
//    "votes": "371"
//},
//"photos_url": "https://www.zomato.com/london/oxo-tower-restaurant-south-bank/photos?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1#tabtop",
//"menu_url": "https://www.zomato.com/london/oxo-tower-restaurant-south-bank/menu?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1&openSwipeBox=menu&showMinimal=1#tabtop",
//"featured_image": "https://b.zmtcdn.com/data/res_imagery/6114148_RESTAURANT_b19c2e9df6e025c836244a2f8d52afb7.jpg",
//"has_online_delivery": 0,
//"is_delivering_now": 0,
//"deeplink": "zomato://restaurant/6114148",
//"has_table_booking": 1,
//"book_url": "https://www.zomato.com/london/oxo-tower-restaurant-south-bank/book?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
//"events_url": "https://www.zomato.com/london/oxo-tower-restaurant-south-bank/events#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"
//}

