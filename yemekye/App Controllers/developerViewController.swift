//
//  developerViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/21/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class developerViewController: UIViewController {

    
    //MARK:- Outlets
    
    @IBOutlet weak var dev1img: UIImageView!
    @IBOutlet weak var dev2img: UIImageView!
    @IBOutlet weak var dev1name: UILabel!
    @IBOutlet weak var dev2name: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dev1img.setRounded()
        dev2img.setRounded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
