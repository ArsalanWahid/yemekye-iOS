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




class ResturantDetialViewController: UIViewController{

    @IBOutlet weak var image: UIImageView!
  
    
    struct restuarntDetailCells{
        static let infoCell = "infoCell"
        static let actionsCell = "actionsCell"
        static let amenitiesCell = "amenitiesCell"
    }
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = RData.Rdata.resturants[cellIndex].resturantImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



//MARK:- Extension-> UItableViewContoller
extension ResturantDetialViewController : UITableViewDelegate, UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //set info cell
        if indexPath.row == 0{
            let cell = Bundle.main.loadNibNamed("InfoTableViewCell", owner: self, options: nil)?.first as! InfoTableViewCell
            
            cell.nameLabel.text = RData.Rdata.resturants[cellIndex].name
            cell.addressLabel.text = RData.Rdata.resturants[cellIndex].address
            cell.statusLabel.text = RData.Rdata.resturants[cellIndex].status
            cell.timingsLabel.text = RData.Rdata.resturants[cellIndex].timing[cellIndex]
            return cell
            
        }
        //set actions cell
        else if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("ActionsTableViewCell", owner: self, options: nil)?.first as! ActionsTableViewCell
            return cell
        
        }
        else if indexPath.row == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: restuarntDetailCells.amenitiesCell)
            return cell!
        }else{
        fatalError("no cell exists in ResturantDetailViewconteller")
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return CGFloat(100.0)
        }
        return CGFloat(44)
    }


}
