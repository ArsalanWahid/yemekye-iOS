//
//  LoginManager.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 11/3/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import Foundation

//MARK:- Singleton
class LoginManager{
    
    
    var isLoggedIn = false
    var resturantIDsRecieved = false
    var locationChanged = 0
    static let LoginStatus = LoginManager()
    
}
