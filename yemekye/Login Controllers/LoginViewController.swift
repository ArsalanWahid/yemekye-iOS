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
    
    
    var email:String?
    
   
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- UnWind Segue
    //Can be used to pick authticated data from sign up user and sign user
    @IBAction func unwindfromSignIn(_ sender: UIStoryboardSegue ){
        if sender.source is SignInViewController{
            LoginManager.LoginStatus.isLoggedIn = true
        }else if sender.source is RegisterViewController{
            LoginManager.LoginStatus.isLoggedIn = true
        }
        UIView.setAnimationsEnabled(false)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Actions
    //When login button is pressed on the login screen
    @IBAction func loginFacebook(_ sender: UIButton) {
        
    }
    
    @IBAction func noSignIn(_ sender: UIButton) {
        //WILL NEED TO FIX THIS AS TECNICALLY USER DIDNT LOGIN MUST ADD STRING HERE
        LoginManager.LoginStatus.isLoggedIn = true
        dismiss(animated: true, completion: nil)
        
    }
    
}














