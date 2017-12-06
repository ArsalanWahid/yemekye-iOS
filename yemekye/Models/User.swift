//
//  User.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/5/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//


import UIKit


enum Role{
    case customer
    case business
}

class User{
    
    let name :String
    let email: String
    var password :String
    var role :Role
    
    
    init?(name:String, email:String, password:String, role:Role) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard !email.isEmpty else {
            return nil
        }
        
        guard !password.isEmpty else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.password = password
        self.role = role
    }
    

}
