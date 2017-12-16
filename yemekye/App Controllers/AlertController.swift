//
//  AlertController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/16/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit


class AlertController{
    
    static func showAlert(_ inViewController: UIViewController , title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}
