//
//  ViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/22/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//




import UIKit

/*
 TODO-LIST
 
 -> Fix with AutoLayout
 -> Add Login/Logout COnditions
 -> Connect with FaceBook Login
 -> Connect With Google Login
 */


class LoginViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mainView: UIView!
    
    //MARK:- Actions
    //When login button is pressed on the login screen
    @IBAction func loginFacebook(_ sender: UIButton) {
        
    }
    
    @IBAction func noSignIn(_ sender: UIButton) {
        //WILL NEED TO FIX THIS AS TECNICALLY USER DIDNT LOGIN MUST ADD STRING HERE
        LoginManager.LoginStatus.isLoggedIn = true
        print(presentingViewController!)
        dismiss(animated: true, completion: nil)
        
    }



    //MARK:- UIViewController

    //FOR THE CASE WHEN USER SIGNS IN SUCCESSFULL AND THIS VIEW APPEARS
    //MAIN -> LOGINMASTER <- SIGNIN
    override func viewWillAppear(_ animated: Bool) {
        //        if LoginManager.LoginStatus.isLoggedIn == true{
        //            mainView.isHidden = true
        //            //SHOWS black screen which is not prefered
        //            self.dismiss(animated: false, completion: nil)
        //        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //hide Navigation Bar
        self.navigationController?.navigationBar.isHidden = true
        
    
        //        if LoginManager.LoginStatus.isLoggedIn == true{
        //            self.dismiss(animated: true, completion: nil)
        //        }
    }
}












