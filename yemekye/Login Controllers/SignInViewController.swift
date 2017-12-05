//
//  SignInViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/27/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit



class SignInViewController: UIViewController ,UITextFieldDelegate{

    
    //MARK:- NSUserDefaults
    //Store values saved in userdefaults
    private var username = UserDefaults.standard.object(forKey: "name") as? String
    private var useremail = UserDefaults.standard.object(forKey: "email") as? String
    private var userpasword = UserDefaults.standard.object(forKey: "password") as? String
    
    //MARK:- values to user
    var uemail:String = ""
    var upassword:String = ""
    
    
    //MARK:- OutLets
    @IBOutlet weak var signInEmail: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signInPassword.delegate = self
        self.signInPassword.delegate = self
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK:- Actions
// if user name password matches then user is loggedin 
  
    @IBAction func signInUser(_ sender: UIButton) {
        if let email = signInEmail.text{
            var temp = email.trimmingCharacters(in: .whitespacesAndNewlines)
            uemail = temp
        }else{
            print("Nothing entered")
        }
        if let password = signInPassword.text{
            var temp = password.trimmingCharacters(in: .whitespacesAndNewlines)
            upassword = temp
        }else{
            print("empty")
        }
        
        if useremail == uemail && userpasword == upassword{
            LoginManager.LoginStatus.isLoggedIn = true
            print("user credentials match")
            self.dismiss(animated: true, completion: nil)
        }else{
            print("User credentials dont match")
        }
        
            //Will go back to loginmaster
            self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelSignIn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
