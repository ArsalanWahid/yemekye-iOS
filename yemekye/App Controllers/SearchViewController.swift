//
//  SearchViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/29/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import  Alamofire
import AlamofireObjectMapper
class SearchViewController: UIViewController,UISearchBarDelegate,UISearchResultsUpdating{
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    //MARK:- Properties
    private var cellindex = 0
    
    var defaultlocations = ["1","2","3","4","5"]
    
    var defaultCities = [ZomatoCities]()
    var filteredLocation:[Any] = []
    
   
    
    //must implement this in navbar
    private var searchBarController : UISearchController!
    private var resultsController = UITableViewController()
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    
    
    //Actions
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarController = UISearchController(searchResultsController: nil)
        setUpNav()
        searchBarController.searchResultsUpdater = self
        searchBarController.dimsBackgroundDuringPresentation = false
        searchBarController.hidesNavigationBarDuringPresentation = false
        
        
        
        
        //API city call
         Request.getCityByName(q: "london")
        
        delayWithSeconds(3){
        self.defaultCities = Request.cityCollection
        }
        print("data recieved")
        print(defaultCities)
        
        }
       
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    
    
    
    
    //MARK:- Private func
    
    private func setUpNav(){
        self.navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "Location";
        
        let image = UIImage(named: "clear-button")
        let closeimage = image?.resizedImage(newSize: CGSize(width: 20, height: 20))
        leftBarButton.image = closeimage
        leftBarButton.tintColor = .white
        searchBarController.searchBar.placeholder = "Enter Your search Here"
        searchBarController.searchBar.frame = CGRect(x: 0, y: 0, width: (navigationController?.view.bounds.size.width)!, height: 64)
        searchBarController.searchBar.barStyle = .default
        searchBarController.searchBar.isTranslucent = false
        searchBarController.searchBar.barTintColor = UIColor.red
        searchBarController.searchBar.backgroundImage = UIImage()
        view.addSubview(searchBarController.searchBar)
    }
    
}

//MARK:- Table Data Source & Delegate
    extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return defaultCities.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = defaultCities[indexPath.row].name
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            cellindex = indexPath.row
            
            //When user clics the specifc city this will request location from zomato API
            //After the data has been retrieved here then it will pass on to the main view controller where it will be used for futher processing
        }
        
    }

extension UIImage {
    
    /// Returns a image that fills in newSize
    func resizedImage(newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
