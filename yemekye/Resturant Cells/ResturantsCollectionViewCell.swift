//
//  ResturantsCollectionViewCell.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/8/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class ResturantsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var image: UIImage!{
        didSet{
            self.imageView.image = image
            self.setNeedsLayout()
        }
    }
}
