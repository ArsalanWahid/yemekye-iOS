//
//  MoreViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/4/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var options = ["settings","Add Resturant"]
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        print("The index path at MoreViewContriller is \(indexPath.row)")
        if indexPath.row == 0{
            performSegue(withIdentifier: "settingMenu", sender: self)
            
        }else if indexPath.row == 1{
            performSegue(withIdentifier: "AddResturant", sender: nil)
        }
    }
    
    
    
    //MARK:-Actions
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        LoginManager.LoginStatus.isLoggedIn = false
            performSegue(withIdentifier: "loginScreen", sender: nil)
        }
    
    }
    



