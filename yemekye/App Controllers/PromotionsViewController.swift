//
//  PromotionsViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/9/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import Foundation

/*
 Implementing the foundation class URL load system here in this class
 */


class PromotionsViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var data: UILabel!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromNetwork()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //Private Functions
    
    
    //By Default this code executes in the background
    func loadFromNetwork() {
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!
        
        let task = URLSession.shared.dataTask(with: url){
            data , response, error in
            
            if error == nil{
                let downloadedImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.image.image = downloadedImage
                    self.data.text = "\(data?.count)"
                }
                
            
                
            }
           
        }
            //will start the network task
            task.resume()
    }

}
