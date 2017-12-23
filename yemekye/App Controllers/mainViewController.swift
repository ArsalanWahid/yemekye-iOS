//
//  mainViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/22/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import FirebaseAuth


/*
 TODO-LIST
 
 contains
 
 1. tableview
 2. UICollectionView
 3. preloaded Data for resturant
 4. navigation
 
 Work flow form this Scene
 
 1. Fix tableView ,set constraints -> covers all screen
 2. Add custom cell or collection View that contains resturants
 3. resturants should be clickable
 4.implement scroll view
 5. after restuarnt is cliked that scene trasitions to ResturantDetailView Class
 
 */


var cellIndex = 0
//VIEW CONTROLLER CODE STARTS HERE
class mainViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    struct StoryBoard{
        static let resturantCell = "resturantCell"
        static let promotionsCell = "promotionscCell"
        static let developerCell = "developerCell"
        static let welcomeCell = "welcomeCell"
    }
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if  Auth.auth().currentUser != nil || LoginManager.LoginStatus.isLoggedIn{
                print("user is loggd in ")
            }else{
                performSegue(withIdentifier: "loginScreenFromResturant", sender: nil)
        }
    }

}
    
//MARK:- Table DataSources
extension mainViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*Use when loading from custom xib file*/
    
        if indexPath.row == 0 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: StoryBoard.welcomeCell,for: indexPath) as! WelcomeTableViewCell
            cell.welcomeLabel.text = "Welcome to Yemek Ye !"
            cell.selectionStyle = UITableViewCellSelectionStyle.none  
            return cell
        }
        
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.resturantCell, for: indexPath) as! ResturantsTableViewCell
            return cell
        }
        
        if indexPath.row == 2{
            //Custom nib file for this cell
            let cell = Bundle.main.loadNibNamed("PromotionsTableViewCell", owner: self, options: nil)?.first as! PromotionsTableViewCell
            
            cell.promotionsLabel.text = "Promotions"
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        if indexPath.row == 3{
            let cell = Bundle.main.loadNibNamed("PromotionsTableViewCell", owner: self, options: nil)?.first as! PromotionsTableViewCell
            
            cell.promotionsLabel.text = "Developers"
            cell.promotionsImage.image = UIImage(named: "laptop.png")
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            if let cell = cell as? ResturantsTableViewCell{
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 100}
        
        if indexPath.row == 1{
            return tableView.bounds.width + 55
        }else{
            return UITableViewAutomaticDimension
        }
        
        
    }
    
    //When user selects the table View cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            print("Welcome screen clicked")
        }
        
        if indexPath.row == 2{
            performSegue(withIdentifier: "showPromotions", sender: nil)
        }
        
        if indexPath.row == 3 {
            print("developers Screen Clicked")
        }
    }
    
    //Set the view for the footer in tableview
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}

//MARK:- UICollectionViewDataSource
extension mainViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    //This will show the 4 resturants
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.resturantCell, for: indexPath) as! ResturantsCollectionViewCell
        
        cell.image = RData.Rdata.resturants[indexPath.row].resturantImage
        cell.nameLabel.text = RData.Rdata.resturants[indexPath.row].name
        cell.addressLabel.text = RData.Rdata.resturants[indexPath.row].address
        cell.rating.text = String(RData.Rdata.resturants[indexPath.row].rating)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        print("Item selected from the main controller is \(cellIndex)")
        performSegue(withIdentifier: "resturantDetail", sender: nil)
    }
    
}




