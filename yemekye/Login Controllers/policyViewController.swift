//
//  policyViewController.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/26/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import WebKit

class policyViewController: UIViewController {

    
    var url: URL?
    
    @IBOutlet weak var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Web page ")
        var request = URLRequest(url: url!)
        webview.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
