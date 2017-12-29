//
//  Service.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/28/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//


import AlamofireObjectMapper
import Alamofire

class Request{
    
    //MARK:- Global header
    private static let headers:HTTPHeaders = [
        "user-key":"876ed9466d61c57c3d172f5a2e95d838"
        
    ]
    
    public static func getCityByName(q:String?) -> [zomatoCities] {
        
        let parameters = [
            
            "q": "\(q!)"
            
        ]
         var cities:[zomatoCities] = []
        
        
        let URL = "https://developers.zomato.com/api/v2.1/cities"
        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<CityResponse>) in
            var requestURL = response.request?.url?.absoluteString
             let cityResponse = response.result.value
            if let response = cityResponse?.location_suggestions{
                for city in response {
                    cities.append(city)
                }
            }
            
            //For looping of data
            //    if let threeDayForecast = weatherResponse?.threeDayForecast {
            //    for forecast in threeDayForecast {
            //    print(forecast.day)
            //    print(forecast.temperature)
            //    }
            //    }
            //    }
        }
        return cities
    }
    
    
    public static func getCityByLocation(longitude lon :Double, latitude lat:Double) {
        
        let parameters = ["lat":"\(lat)","lon": "\(lon)"]
        
        
        
        let URL = "https://developers.zomato.com/api/v2.1/cities"
        Alamofire.request(URL,parameters:parameters,headers:headers).responseObject { (response: DataResponse<CityResponse>) in
            print("Response code: \((response.response?.statusCode)!)")
            if (response.response?.statusCode)! == 200 {
            var requestURL = response.request?.url?.absoluteString
            let cityResponse = response.result.value
                if cityResponse?.location_suggestions?.count == 0 {
                    print("No items recieved: \n")
                }
                else{
                    for city in (cityResponse?.location_suggestions)! {
                        print(city)
                    }
                }
            }
            //For looping of data
            //    if let threeDayForecast = weatherResponse?.threeDayForecast {
            //    for forecast in threeDayForecast {
            //    print(forecast.day)
            //    print(forecast.temperature)
            //    }
            //    }
            //    }
        }
        
    }
    
    
    
    
}
