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
var resturants = [Resturant(image: #imageLiteral(resourceName: "macdonals"), name: "Dominos", status: "Open", address: "Madison Ave", phoneNumber: "+11689785"),
                  Resturant(image: #imageLiteral(resourceName: "dominas"), name: "Dominos", status: "Open", address: "Madison Ave", phoneNumber: "+1123426"),
                  Resturant(image: #imageLiteral(resourceName: "burgerKing"), name: "Burger King", status: "Open", address: "karachi", phoneNumber: "+1144432235"),
                  Resturant(name: "KFC", locationOpen: Country.existingCountries, menu: <#T##[Menu]#>, timings: <#T##[String]#>, resturantImage: <#T##UIImage?#>, status: <#T##String#>, address: <#T##String#>, phonenumber: <#T##String#>)
]

var cellIndex = 0




//VIEW CONTROLLER CODE STARTS HERE
class mainViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- Properties
    
    var _menuOpen = false
    
    //MARK:- OUTLETS
    @IBOutlet weak var open: UIBarButtonItem!
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
   
    //MARK:- Actions
    
    @IBAction func openMenu(_ sender: UIBarButtonItem){
        if _menuOpen{
        //Shows the side menu
        leadingConstraint.constant = -320
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }else{
    leadingConstraint.constant = 0
    UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    _menuOpen = !_menuOpen
    
    }
    
    
}
