//
//  CoinsDetailsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 18/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class CoinsDetailsController: UIViewController {
    
    var coinsDetails = [CoinMarketCap]()
    
    //MARK:- UISetup
    let backgroundContainer: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.gray
        view.layer.opacity = 0.1
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let cryptoTitleLable = UILabel(lines: 2, title: "CryptoTitle", font: UIFont(name: "Poppins-Light", size: 20)! , alignment: .center, color: .white)
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        setupUI()
        
        
    }
    
    fileprivate func setupUI() {
        view.addSubview(backgroundContainer)
        backgroundContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 220, height: 400)
        view.addSubview(cryptoTitleLable)
        cryptoTitleLable.anchor(top: backgroundContainer.topAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
    }
    
    
}
