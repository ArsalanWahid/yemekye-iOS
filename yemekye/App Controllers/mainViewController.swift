//
//  mainViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/22/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookCore
/*
 TODO-LIST
 
 contains
 
 1. tableview
 2. UICollectionView
 3. preloaded Data for resturant
 4. navigation
 5. Facebook login
 Work flow form this Scene
 
 1. Fix tableView ,set constraints -> covers all screen
 2. Add custom cell or collection View that contains resturants
 3. resturants should be clickable
 4.implement scroll view
 5. after restuarnt is cliked that scene trasitions to ResturantDetailView Class
 
 */

var cellIndex = 0

class mainViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
   
    
    
    //MARK:- Cell Identifiers
    struct StoryBoard{
        static let resturantCell = "resturantCell"
        static let promotionsCell = "promotionscCell"
        static let developerCell = "developerCell"
        static let welcomeCell = "welcomeCell"
        static let resturantDetail = "resturantDetail"
        static let loginScreenFromResturant = "loginScreenFromResturant"
        static let showPromotions = "showPromotions"
    }
    
    //MARK:- Life Cycle ---to be done later
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .red
        fetchProfile()
        setNavbar()
        
    }
    
    
    
    
    //MARK:- Private function
    private func setNavbar(){
        let middleItem = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        middleItem.backgroundColor = UIColor.clear
        let searchButton  = UIButton(type: .custom)
        searchButton.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        searchButton.setTitle("Search ^", for: .normal)
        searchButton.backgroundColor = UIColor.darkGray
        searchButton.addTarget(self, action: #selector(searchView), for: UIControlEvents.touchUpInside)
        middleItem.addSubview(searchButton)
        self.navigationItem.titleView = middleItem
    }
    
    @objc private func searchView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    //############NO IDEA HOW THIS WORKS#######################
    func fetchProfile(){
        
        struct MyProfileRequest: GraphRequestProtocol {
            struct Response: GraphResponseProtocol {
                init(rawResponse: Any?) {
                    // Decode JSON from rawResponse into other properties here.
                }
            }
            
            var graphPath = "/me"
            var parameters: [String : Any]? = ["fields": "id,email, name"]
            var accessToken = AccessToken.current
            var httpMethod: GraphRequestHTTPMethod = .GET
            var apiVersion: GraphAPIVersion = .defaultVersion
        }
        
        
        let connection = GraphRequestConnection()
        connection.add(MyProfileRequest()) { response, result in
            switch result {
            case .success(let response):
                print(response)
            case .failed(let error):
                print("Custom Graph Request Failed: \(error)")
            }
        }
        connection.start()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if  Auth.auth().currentUser != nil || LoginManager.LoginStatus.isLoggedIn{
            print("user is loggd in ")
        }else{
            performSegue(withIdentifier: StoryBoard.loginScreenFromResturant, sender: nil)
        }
    }
    
    
    
    //MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.resturantDetail{
            let detailTVC = segue.destination as! ResturantDetialViewController
            let image = RData.Rdata.resturants[cellIndex].resturantImage
            detailTVC.image = image
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
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        
        if indexPath.row == 3{
            let cell = Bundle.main.loadNibNamed("PromotionsTableViewCell", owner: self, options: nil)?.first as! PromotionsTableViewCell
            
            cell.promotionsLabel.text = "Developers"
            cell.promotionsImage.image = UIImage(named: "laptop.png")
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = UITableViewCellSelectionStyle.none
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
            performSegue(withIdentifier: StoryBoard.showPromotions, sender: nil)
        }
        
        if indexPath.row == 3 {
            print("developers Screen Clicked")
        }
    }
    
    
}

//MARK:- UICollectionViewDataSource
extension mainViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    //This will show the 4 resturants
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    //This will fill the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.resturantCell, for: indexPath) as! ResturantsCollectionViewCell
        
        cell.image = RData.Rdata.resturants[indexPath.row].resturantImage
        cell.nameLabel.text = RData.Rdata.resturants[indexPath.row].name
        cell.addressLabel.text = RData.Rdata.resturants[indexPath.row].address
        cell.rating.text = String(RData.Rdata.resturants[indexPath.row].rating)
        return cell
        
    }
    
    //This will perform logic for when item from collection  view is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        print("User has selected \(cellIndex) from collection View on main app controller")
        let image: UIImage =  RData.Rdata.resturants[cellIndex].resturantImage
        performSegue(withIdentifier: StoryBoard.resturantDetail, sender: image)
    }
    
}




