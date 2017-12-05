//
//  SettingViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/4/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    
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
    
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return settingOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "settingMenuCell", for: indexPath)
        cell.textLabel?.text = settingOptions[indexPath.row]
        return cell
    }
    
    
    //MARK:-UITalbleViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "loginScreenFromSettingMenu", sender: nil)
        }else if indexPath.row == 1{
            LoginManager.LoginStatus.isLoggedIn = false
            performSegue(withIdentifier: "loginScreenFromSettingMenu", sender: nil)
        }
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
