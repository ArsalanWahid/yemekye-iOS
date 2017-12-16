//
//  ActionsTableViewCell.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/15/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {

    @IBAction func callpressed(_ sender: UIButton) {
        let url :NSURL = NSURL(string: "tel://\(RData.Rdata.resturants[cellIndex].phoneNumber)")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func webSitePressed(_ sender: UIButton) {
        let url: URL = URL(string: "http://yemekye-com.stackstaging.com/wordpress/")!
        //        UIApplication.shared.openURL(URL(string: "http://yemekye-com.stackstaging.com/wordpress/")!)
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
