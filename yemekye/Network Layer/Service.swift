//
//  Service.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/28/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//


import AlamofireObjectMapper
import Alamofire


//stores data from the API calls
var _cityCollection = [ZomatoCities]()
var _LocationsFromAPI = [Locations]()
var _LocationDetail = [LocationDetail]()

class Request{
    
    //MARK:- Global header
    private static let headers:HTTPHeaders = [
        "user-key":"876ed9466d61c57c3d172f5a2e95d838"
        
    ]
    


    
    //THis will be populated by the request method that the app can later use
    
    
    //MARK:- Get city by name
    static func getCityByName(q: String?){
        
        let parameters = ["q": "\(q!)","count":"\(10)"]
        
        let URL = "https://developers.zomato.com/api/v2.1/cities"
        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<CityResponse>) in
            
            let requestURL = response.request?.url?.absoluteString
            print(requestURL ?? "")
            
            let cityResponse = response.result.value
            if let response  = cityResponse?.location_suggestions{
                for city in response{
                                        print(city.country_id)
                                        print(city.name)
                                        print(city.country_id)
                                        print(city.country_name)
                                        print(city.is_state)
                                        print(city.state_name)
                                        print(city.state_code)
                                        print(city.location)
                    //this should populate the [ZomatoCity array with data ]
                    _cityCollection.append(city)
                }
              //  completion(cityCollection)
            }
        }
    }
    
    







    //MARK:- Get Location
    static func getLocation(_ query: String){

        //Will be populated by response from API
        //Makes sure previous data is removed
        _LocationsFromAPI = []
        let parameters = [Constants.ParametersKeys.query : "\(query)","count":"\(10)"]
        let URL = "\(Constants.Zomato.APIBaseURL)\(Constants.Method.locations)"
        print(URL)
        print(parameters)

        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<LocationResponse>) in
            var requestURL = response.request?.url?.absoluteString
            let LocationResponse = response.result.value
            if let response = LocationResponse?.location_suggestions{
                print("The response from the locations are \(response)")
                for location in response {
                    _LocationsFromAPI.append(location)
                }
            }
        }
    }
    
    
    //MARK:- Get Location Detail
    
//    static func getLocationDetial(_ entity_id: Int , _ entity_type: String){
//
//        _LocationDetail = []
//        let parameters = ["entity_id" : "\(entity_id)" , "entity_type" : "\(entity_type)"]
//        let URL = "https://developers.zomato.com/api/v2.1/location_details"
//        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<LocationDetailResponse>) in
//            var requestURL = response.request?.url?.absoluteString
//            let LocationDetailResponse = response.result.value
//            if let response = LocationResponse?.location_suggestions{
//                print("The response from the locations are \(response)")
//                for location in response {
//                    _LocationsFromAPI.append(location)
//                }
//            }
//        }
//        
//
    
        
        
//    }


}

