//
//  mainViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/22/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit




//Structure for the resturants


//MARK:- Model

//Need to fix this and add to a model class


//Need to fix this and add to someplace from FoodTracker App


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


var user :User? = User(name: "arsalan", email: "arsalanwahid1993@gmail.com", password: "1234", role: .customer)


var cellIndex = 0


var resturants = [Resturant]()

//VIEW CONTROLLER CODE STARTS HERE
class mainViewController: UIViewController {
    
    //MARK:- Properties
    
    var _menuOpen = false
    
    //MARK:- OUTLETS
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        //change the color of the nav bar here
        //        self.navigationController?.navigationBar.isHidden = false
        //        navigationController?.navigationBar.barTintColor = .red
        //        self.navigationItem.setHidesBackButton(true, animated: true)
        //       open.target = self.revealViewController()
        //        open.action = Selector("revealToggle:")
        
        //GESTURE FOR FOR SIDE MENU
        // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //This will navigate to login screen initiall as zamato does
        if LoginManager.LoginStatus.isLoggedIn == false{
            performSegue(withIdentifier: "loginScreenFromResturant", sender: nil)
        }else{
            
        }
        
        
        
    }
    
    //MARK:- Actions
    @IBAction func logout(_ sender: UIBarButtonItem) {
      LoginManager.LoginStatus.isLoggedIn = false
       performSegue(withIdentifier: "loginScreenFromResturant", sender: nil)
       // self.navigationController?.popToViewController(LoginViewController(), animated: true)
    }
    

    //MARK:- Table DataSources
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = Bundle.main.loadNibNamed("ResturantCell1", owner: self, options: nil)?.first as! ResturantCell1
        cell.ResturantImage.image = resturants[indexPath.row].resturantImage
        cell.ResturantName.text = resturants[indexPath.row].name
       return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        print("The index path at MainviewContriller is \(indexPath.row)")
        performSegue(withIdentifier: "resturantDetial", sender: self)
    }

  
    //Private Functions
    private func preloadResturantData() {
        
        
    
        let bundle = Bundle(for: type(of: self))
        let kfc1 = UIImage(named: "krunchburger", in: bundle, compatibleWith: self.traitCollection)
        let kfc2 = UIImage(named:"mightyzinger", in: bundle, compatibleWith: self.traitCollection)
        let kfc3 = UIImage(named:"zinger", in: bundle, compatibleWith: self.traitCollection)
        let kfclogo = UIImage(named: "kfc", in: bundle, compatibleWith: self.traitCollection)
        
        guard let mealKFC1 = Meal(name: "Mighty Burger", photo: kfc1, rating: 2) else{
            fatalError("Something bad happened while making meal object")}
        
        guard let mealKFC2 = Meal(name: "Zinger Love", photo: kfc2, rating: 4) else{
            fatalError("Something bad happened while making meal object")
        }
        
        guard let mealKFC3 = Meal(name: "Random Stuff", photo: kfc3, rating: 5) else{
            fatalError("Something bad happened while presenting tasty salad")
        }
        
        
        let kfcMenu = Menu(meals: [mealKFC1,mealKFC2,mealKFC3])
       
        
        let KFC = Resturant(name: "Kfc", menu: kfcMenu, timings: ["11am","11pm"], resturantImage: kfclogo!, status: "open", address: "karachi Pakistan", phonenumber: "0511555113")
        
        var karachi = City(name: "karachi", resturants: [KFC!])
        
        var pakistan = Country(name: "pakistan", cities: [karachi])
    }
    
    
    
}


