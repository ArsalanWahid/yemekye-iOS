//
//  SearchViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/29/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    let a = ["1","2"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var searchBarController : UISearchController!
    private var resultsController = UITableViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = searchBarController.searchBar
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = a[indexPath.row]
        return cell
    }
}
