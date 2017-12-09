//
//  MoreViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/4/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var options = ["settings","Add Resturant","App Website"]
    
    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .red

        
    }
    
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        print("The index path at MoreViewContriller is \(indexPath.row)")
        if indexPath.row == 0{
            performSegue(withIdentifier: "settingMenu", sender: self)
            
        }else if indexPath.row == 1{
            performSegue(withIdentifier: "AddResturant", sender: nil)
        }else if indexPath.row == 2{
           openWebsite()
        }
        
        
        
    }
    
    //MARK:- Private Functions
    private func openWebsite(){
        UIApplication.shared.openURL(URL(string: "http://yemekye-com.stackstaging.com/wordpress/")!)
    }
    
    //MARK:-Actions
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        LoginManager.LoginStatus.isLoggedIn = false
            performSegue(withIdentifier: "loginScreen", sender: nil)
        }
    
    }
    



