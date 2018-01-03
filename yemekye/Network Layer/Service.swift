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
var _Resturants_ids = [String]()
var ResturantsFromAPI = [ResturantResponse]()
//var _LocationDetail = [LocationDetail]()

class Request{
    
    //MARK:- Global header
    private static let headers:HTTPHeaders = [
        "user-key":"876ed9466d61c57c3d172f5a2e95d838"
        
    ]
    


    

    //MARK:- Get Location
    
    /**
     This functions returns the the `location` closest location names based on the search Text the user provides
     */
    
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
    
    static func getLocationDetial(_ entity_id: Int , _ entity_type: String){

        _Resturants_ids = []
        let parameters = ["entity_id" : "\(entity_id)" , "entity_type" : "\(entity_type)"]
        let URL = "https://developers.zomato.com/api/v2.1/location_details"
        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<LocationDetailResponse>) in
            var requestURL = response.request?.url?.absoluteString
            let LocationDetailResponse = response.result.value
            
            //TO MUCH DATA BEING GOT
            if let response = LocationDetailResponse?.popularity{
                print(response)
            }
            if let response = LocationDetailResponse?.nearby_res{
                for n in response{
                    _Resturants_ids.append(n)
                }
            }
            
        }
    }
    
    
    
    //MARK:- Get Single REsturant Info
    
    static func getResturantInfo(From id : Int){
        
    
        let parameters = ["res_id":"\(id)"]
        let URL = "https://developers.zomato.com/api/v2.1/restaurant"
        Alamofire.request(URL,parameters:parameters,headers: headers).responseObject { (response: DataResponse<ResturantResponse>) in
            
            let ResturantResponse = response.result.value
        
            if let response = ResturantResponse {
                print("This is the URL for thumb image \(response.thumb)")
                ResturantsFromAPI.append(response)
            }
            
        }
        
    }


}

