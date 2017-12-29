//
//  ViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/22/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//




import UIKit
import FirebaseAuth 
import FacebookLogin
import FacebookCore
/*
 TODO-LIST
 
 -> Fix with AutoLayout
 -> Add Login/Logout COnditions
 -> Connect with FaceBook Login
 -> Connect With Google Login
 */


class LoginViewController: UIViewController,LoginButtonDelegate{
    
    
   
    //MARK:- Facebook Login Functions
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .success:
            let accessToken = AccessToken.current
            guard let accessTokenString = accessToken?.authenticationToken else{ return }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    // ...
                    return
                }
                // User is signed in
                print("This is the user loaded \(user)")
                self.dismiss(animated: true, completion: nil)
            }
        default:
            fatalError("SomeThing Shitty Happened with facebook login")
        }
        
        }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    
    
    
    
   
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add custom facebook UI button and read permission to access token for user data
        var loginButton = LoginButton(readPermissions: [ .publicProfile])
        loginButton.center = view.center
        loginButton.frame = CGRect(x: 16, y: 437, width: 343, height: 40)
        view.addSubview(loginButton)
        loginButton.delegate = self as LoginButtonDelegate
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//
        
        Auth.auth().addStateDidChangeListener{ auth ,user in
            if user != nil{
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
    
    //MARK:- UnWind Segue
    //Can be used to pick authticated data from sign up user and sign user
    @IBAction func unwindfromSignIn(_ sender: UIStoryboardSegue ){
      
    }
    
    //MARK:- Actions
    //When login button is pressed on the login screen
    @IBAction func loginFacebook(_ sender: UIButton) {
        
    }
    
    @IBAction func noSignIn(_ sender: UIButton) {
        //WILL NEED TO FIX THIS AS TECNICALLY USER DIDNT LOGIN MUST ADD STRING HERE
        LoginManager.LoginStatus.isLoggedIn = true
        print("User has decided not to sign in now")
        UIView.setAnimationsEnabled(true)
        dismiss(animated: true, completion: nil)
        
    }
    
}














