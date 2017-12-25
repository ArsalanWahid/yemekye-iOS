//
//  SettingViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/4/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import FirebaseAuth
class SettingViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    var settingOptions = ["Login","Logout"]
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "settingMenuCell")
        if LoginManager.LoginStatus.isLoggedIn{
            cell?.textLabel?.text = "Login"
        }else{
            cell?.textLabel?.text = "Logout"
        }
        return cell!
    }
    
    
    //MARK:-UITalbleViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            if LoginManager.LoginStatus.isLoggedIn{
                LoginManager.LoginStatus.isLoggedIn = false
                performSegue(withIdentifier: "loginScreenFromSettingMenu", sender: nil)
            }else{
                try! Auth.auth().signOut()
                performSegue(withIdentifier: "loginScreenFromSettingMenu", sender: nil)
            }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
