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
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    
    //MARK:- Cell Identifiers
    struct StoryBoard{
        static let resturantCell = "resturantCell"
        static let promotionsCell = "promotionscCell"
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        if  Auth.auth().currentUser != nil || LoginManager.LoginStatus.isLoggedIn{
            print("user is loggd in ")
        }else{
            UIView.setAnimationsEnabled(false)
            performSegue(withIdentifier: StoryBoard.loginScreenFromResturant, sender: nil)
        }
        
        //MARK:- Returant data obtained here !!
        if LoginManager.LoginStatus.resturantIDsRecieved == true{
            
            // Request for the resturant data here pleae
            print("requesting data for resturants")
            print("REquest value = \(LoginManager.LoginStatus.resturantIDsRecieved)")
            
            let loop = _Resturants_ids.prefix(5)
            let newarray = Array(loop)
            
            for n in newarray{
                
                Request.getResturantInfo(From: Int(n)!)
                print("data gotten")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                
                print(ResturantsFromAPI.count)
                print("getting data")
                self.tableview.reloadData()
                
                
            })
            //  LoginManager.LoginStatus.resturantIDsRecieved = false
        }else{
            //keep the conventioanl data
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        LoginManager.LoginStatus.resturantIDsRecieved = false
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
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    @objc private func searchView(){
        performSegue(withIdentifier: "search", sender: nil)
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
        
        return 3
        
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
        
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            if let cell = cell as? ResturantsTableViewCell{
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
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
        
        if indexPath.row == 2{
            performSegue(withIdentifier: StoryBoard.showPromotions, sender: nil)
        }
    }
    
    
}


//MARK:- UICollectionViewDataSource
extension mainViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    //This will show the 4 resturants
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if LoginManager.LoginStatus.resturantIDsRecieved == false{
            return 4
        }else{
            //will return count for total resturants here
            return ResturantsFromAPI.count
        }
        
    }
    
    
    //This will fill the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.resturantCell, for: indexPath) as! ResturantsCollectionViewCell
        
        if LoginManager.LoginStatus.resturantIDsRecieved == true{
            cell.nameLabel.text = ResturantsFromAPI[indexPath.row].name
            cell.addressLabel.text = ResturantsFromAPI[indexPath.row].location.locality
            cell.rating.text = ResturantsFromAPI[indexPath.row].user_rating.aggregate_rating
            //cell.image = ResturantsFromAPI[indexPath.row].thumb
            
            return cell
        }else{
            
            cell.image = RData.Rdata.resturants[indexPath.row].resturantImage
            cell.nameLabel.text = RData.Rdata.resturants[indexPath.row].name
            cell.addressLabel.text = RData.Rdata.resturants[indexPath.row].address
            cell.rating.text = String(RData.Rdata.resturants[indexPath.row].rating)
            return cell
            
        }
        
    }
  
    
    
    //This will perform logic for when item from collection  view is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        LoginManager.LoginStatus.resturantIDsRecieved = false
        cellIndex = indexPath.row
        print("User has selected \(cellIndex) from collection View on main app controller")
        if cellIndex <= 4 {
            let image: UIImage =  RData.Rdata.resturants[cellIndex].resturantImage
            
            performSegue(withIdentifier: StoryBoard.resturantDetail, sender: image)
            
        }
    }
    
    
    
    
}




