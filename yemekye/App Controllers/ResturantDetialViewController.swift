//
//  ResturantDetialViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/22/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

/*
 TODO-LIST

 contains
 
 1. tableview
 2. ScrollView
 3. Collection View
 4. Navigation
 5.Resturant Details
 6.menu Clickable
 
 
 WorkFlow
 1.This is presented after user selects a resturant from the mainViewControllerafter
 2. Fix this view with auto layout
 2a. This scene will show all the properties of the resturant object that has been selected
 3. Implement scoll view
 */




class ResturantDetialViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var timing: UILabel!
    @IBOutlet weak var menu: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      image.image = RData.Rdata.resturants[cellIndex].resturantImage
      name.text = RData.Rdata.resturants[cellIndex].name
      address.text = RData.Rdata.resturants[cellIndex].address
      rating.text = String(RData.Rdata.resturants[cellIndex].rating)
      status.text = RData.Rdata.resturants[cellIndex].status
      let t1 = RData.Rdata.resturants[cellIndex].timing[0]
        _ = RData.Rdata.resturants[cellIndex].timing[1]
      timing.text = "\(t1) - \(t1)"
      menu.text = "To be displayed"
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Actions
    
    @IBAction func callResturant(_ sender: Any) {
        
        let url :NSURL = NSURL(string: "tel://\(RData.Rdata.resturants[cellIndex].phoneNumber)")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    
    }
    
}
