//
//  AmenitiesTableViewCell.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/25/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class AmenitiesTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var phone: UIButton!
    
    @IBAction func phoneNumber(_ sender: UIButton) {
        let url :NSURL = NSURL(string: "tel://\(phone.titleLabel?.text)")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBOutlet weak var cuisinesLabel: UILabel!
    @IBOutlet weak var avgCostLabel: UILabel!
    @IBOutlet weak var currency: UILabel!
    
    
}
