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
    
    
    
    //Function is not returning desired cities of type zomotocities
    static func getCityByName(q:String?) -> [ZomatoCities] {
        
        let parameters = [
            
            "q": "\(q!)"
            
        ]
        
        //not working
        var cities:[ZomatoCities] = []   //This should be populated by API return
        let URL = "https://developers.zomato.com/api/v2.1/cities"
        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<CityResponse>) in
            
            var requestURL = response.request?.url?.absoluteString
            let cityResponse = response.result.value
            if let response = cityResponse?.location_suggestions{
                for city in response {
                    cities.append(city) //why is this not working , this should be filled by json returns
                    print("The cities got are \(city)")  //this is working ,but wont populate cities array
                }
            }else{
                print("No data recieved")
            }
        }
        //not working cant 
        print("Values being returned are \(cities) from service")
        return cities
    }
    
    
    static func getCityByLocation(longitude lon :Double, latitude lat:Double) {
        
        let parameters = ["lat":"\(lat)","lon": "\(lon)"]
        
        
        
        let URL = "https://developers.zomato.com/api/v2.1/cities"
        let URL1 = ("\(Constants.Zomato.APIBaseURL)+\(Constants.Method.cities)")
        
        
        
        
        Alamofire.request(URL1,parameters:parameters,headers:headers).responseObject { (response: DataResponse<CityResponse>) in
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
    
    
    
    static func getLocation(_ query: String) -> [Locations]{
        
        //Will be populated by response from API
        var locations:[Locations] = []
        
        let parameters = [Constants.ParametersKeys.query : "\(query)"]
        let URL = "\(Constants.Zomato.APIBaseURL)\(Constants.Method.locations)"
        print(URL)
        print(parameters)
        
        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<LocationResponse>) in
            var requestURL = response.request?.url?.absoluteString
            let LocationResponse = response.result.value
            if let response = LocationResponse?.location_suggestions{
                print("The response from the locations are \(response)")
                for location in response {
                    locations.append(location)
                    print("The locations returned are \(location.city_name!)")
                }
                
            }
            
        }
        return locations
    }
    
    
}
