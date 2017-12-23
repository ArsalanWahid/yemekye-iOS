//
//  RegisterViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/27/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import os.log
import Firebase
import FirebaseAuth
class RegisterViewController: UIViewController ,UITextFieldDelegate{
    
    //MARK:- Properties
    var user:User?
    
    //MARK:- OUTLETS
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var termsOfService: UIButton!
    @IBOutlet weak var privacyPolicy: UIButton!
    @IBOutlet weak var cookiePolicy: UIButton!
    @IBOutlet weak var contentPolicy: UIButton!
    
    //MARK:- Actions
    
    @IBAction func faceBookLogin(_ sender: UIButton) {
        //IMPLEMENT LATER
    }
    
    @IBAction func googleLogin(_ sender: UIButton) {
        //IMPLEMENT LATER
    }
    
    
    @IBAction func cancelSignUP(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func singUpUser(_ sender: UIButton) {
        //call firebase here for authentication
        guard let username = nameTextField.text,
            username != "",
            let email  = emailTextField.text,
            email != "",
            let password = passwordTextField.text,
            password != ""
            else{
                AlertController.showAlert(self, title: "Missing Info ", message: "Please fill all the fields")
                return
                
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { user , error in
            if error == nil && user != nil {
                print("user created")
                
                let chageRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                chageRequest?.displayName = username
                chageRequest?.commitChanges{ error in
                    if error == nil{
                        print("User diaply name changed")
                    }
                    
                }
            }else{
                print("Could not create user due to  \(error)")
            }
            
        }
    
    }
    
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        navigationController?.navigationBar.barTintColor = .red
        
        //Custom Buttons at Bottom screen
        termsOfService.setAttributedTitle(buttonUnderline("Terms of Service", 11), for: .normal)
        privacyPolicy.setAttributedTitle(buttonUnderline("Privay Policy", 11), for: .normal)
        cookiePolicy.setAttributedTitle(buttonUnderline("Cookie Policy", 11), for: .normal)
        contentPolicy.setAttributedTitle(buttonUnderline("Content Policies", 11), for: .normal)
        
    }
    
    
    
    //MARK:- UITextFieldDelegate
    
    //close Keyboard when user taps screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //On return key pressed on the keyboard this method will resign the current textfield first reponder and give it some appropriate object
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    //MARK:- Naivgation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let userName  = nameTextField.text ?? ""
        let userEmail = emailTextField.text ?? ""
        let userPassword = passwordTextField.text ?? ""
        
        user = User(name: userName, email: userEmail, password: userPassword, role: .customer)
    }
    
    //MARK:- Actions
    
    
    //MARL:- Private Functions
    
    //CUSTOMZIE BUTTONS CODE IN THE REGISTER USER VIEW
    private func buttonUnderline(_ message: String, _ size: Int) -> NSAttributedString{
        let yourAttributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: CGFloat(size)),
            NSAttributedStringKey.foregroundColor : UIColor.darkGray,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
        //.styleDouble.rawValue, .styleThick.rawValue, .styleNone.rawValue
        let attributeString = NSMutableAttributedString(string: message,
                                                        attributes: yourAttributes)
        return attributeString
    }
    
    
    
    
}


