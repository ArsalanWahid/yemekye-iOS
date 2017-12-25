//
//  ResturantHeaderView.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/24/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

/*
 This is the custom code for the streachy header view in the ResturantDetailViewController

 Material was taken from  https://youtu.be/7pbU3BRqa7A
 
 */


class ResturantHeaderView: UIView {

    
    //MARK:-Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    //To make sure we get image here

    var image: UIImage? {
        didSet{
            if let image = image{
                imageView.image = image
            }else{
                 imageView.image = nil
            }
        }
    }
    
    
 
}
