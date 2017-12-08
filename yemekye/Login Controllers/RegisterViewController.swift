//
//  RegisterViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 10/27/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import os.log
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
    
    
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
        //Custom Buttons at Bottom screen
        termsOfService.setAttributedTitle(buttonUnderline("Terms of Service", 11), for: .normal)
        privacyPolicy.setAttributedTitle(buttonUnderline("Privay Policy", 11), for: .normal)
        cookiePolicy.setAttributedTitle(buttonUnderline("Cookie Policy", 11), for: .normal)
        contentPolicy.setAttributedTitle(buttonUnderline("Content Policies", 11), for: .normal)
        
    }
    
    
    
    //MARK:- UITextFieldDelegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //MARK:- Naivgation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let userName  = nameTextField.text ?? ""
        let userEmail = emailTextField.text ?? ""
        let userPassword = passwordTextField.text ?? ""
        
        user = User(name: userName, email: userEmail, password: userPassword, role: .customer)
    }
    
    //    //MARK:- Actions
    //    @IBAction func SignUpUser(_ sender: UIButton) {
    //        //VALIDATE FIELDS ARE NOT EMPTY
    //        if let name  = name.text{
    //            var temp = name.trimmingCharacters(in: .whitespacesAndNewlines)
    //            UserDefaults.standard.set(temp, forKey: "name")
    //        }else{
    //            print("value empty")
    //        }
    //
    //        if let email = email.text{
    //            var temp = email.trimmingCharacters(in: .whitespacesAndNewlines)
    //            UserDefaults.standard.set(temp, forKey: "email")
    //        }else{
    //            print("empty")
    //        }
    //
    //        if let password = password.text{
    //            var temp = password.trimmingCharacters(in: .whitespacesAndNewlines)
    //            UserDefaults.standard.set(temp, forKey: "password")
    //        }else{
    //            print("Error in password")
    //        }
    //        UserDefaults.standard.synchronize() //Hard flush to disk
    //
    //        self.dismiss(animated: true, completion: nil)
    //        //DISMISS VIEW AND SHOW LOGIN PAGE
    //    }
    //
    
    
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


