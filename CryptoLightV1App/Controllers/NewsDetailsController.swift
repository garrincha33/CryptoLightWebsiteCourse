//
//  NewsDetailsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 16/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit
import WebKit

//Protocol implementation

protocol NewsDetailsWebControllerDelegate {
    func didSendUrl(article: NewsArticle)
}


class NewsDetailsController: UIViewController {
    
    var delegate: NewsDetailsWebControllerDelegate?
    
    var newsArticles: NewsArticle?
    var articleUrl = ""
    
    var webView: WKWebView = {
        var view = WKWebView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isOpaque = false
        view.backgroundColor = .rgb(red: 38, green: 45, blue: 47)
        view.scrollView.backgroundColor = UIColor.clear
        view.scrollView.bounces = false
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        
        getWebUrl()
        setupUI()

    }
    
    fileprivate func setupUI() {
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    fileprivate func getWebUrl() {
        guard let url = URL(string: articleUrl) else {return}
        let myURLRequest: URLRequest = URLRequest(url: url)
        webView.load(myURLRequest)
    }
}
