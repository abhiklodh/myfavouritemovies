//
//  TMDBAuthViewController.swift
//  TheMovieManager
//
//  Created by Jarrod Parkes on 2/11/15.
//  Copyright (c) 2015 Jarrod Parkes. All rights reserved.
//

import UIKit

class TMDBAuthViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var urlRequest: NSURLRequest? = nil
    var requestToken: String? = nil
    var completionHandler : ((success: Bool, errorString: String?) -> Void)? = nil
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        self.navigationItem.title = "TheMovieDB Auth"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "cancelAuth")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if urlRequest != nil {
            self.webView.loadRequest(urlRequest!)
        }
    }
    
    // MARK: - UIWebViewDelegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        if(webView.request!.URL.absoluteString! == "\(TMDBClient.Constants.AuthorizationURL)\(requestToken!)/allow") {
            
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.completionHandler!(success: true, errorString: nil)
            })
        }
    }

    func cancelAuth() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}