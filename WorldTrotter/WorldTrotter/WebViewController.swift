//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by stephen batifol on 04/06/16.
//  Copyright © 2016 stephen batifol. All rights reserved.
//


import UIKit
import WebKit
import CoreLocation



class WebViewController: UIViewController{
    var webView: WKWebView?
    
    
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string:"http://www.google.com")
        let req = NSURLRequest(URL: url!)
        self.webView!.loadRequest(req)
               
    }
}

