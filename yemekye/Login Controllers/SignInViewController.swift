//
//  SignInViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/27/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import FirebaseAuth



class SignInViewController: UIViewController ,UITextFieldDelegate{
    
    //MARK:- Outlets
    @IBOutlet weak var signInEmail: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    
    //MARK:- Actions
    // if user name password matches then user is loggedin
    @IBAction func signInUser(_ sender: UIButton) {
     
        var a = signInEmail.text
        a = a?.trimmingCharacters(in: .whitespaces)
        print(a)
        var b = signInPassword.text
        b = b?.trimmingCharacters(in: .whitespaces)
        print(b)
        
        Auth.auth().signIn(withEmail: a!, password: b!){user ,error in
            if error == nil && user != nil{
                print("User was successfully logged in")
                
                
                self.dismiss(animated: false, completion: nil)
            }else{
                print("User could not be loaded")
            }
        }
    }
    
    @IBAction func cancelSignIn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .red
        self.signInPassword.delegate = self
        self.signInPassword.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- UITextFieldDelegate
    
    //close Keyboard when user taps screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //On return key pressed on the keyboard this method will resign the current textfield first reponder and give it some appropriate object
        signInEmail.resignFirstResponder()
        signInPassword.resignFirstResponder()
        return true
    }
    
    
    //MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
