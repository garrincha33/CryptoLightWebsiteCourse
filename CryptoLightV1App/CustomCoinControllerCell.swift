//
//  CustomCoinControllerCell.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 03/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class CustomCoinControllerCell: UICollectionViewCell {
    
    var symbol: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "systemFont", size: 40)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    var currentPrice: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "systemFont", size: 20)
        lable.textColor = .green
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(symbol)
        symbol.topAnchor.constraint(equalTo: topAnchor).isActive = true
        symbol.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        symbol.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        addSubview(currentPrice)
        currentPrice.leftAnchor.constraint(equalTo: symbol.rightAnchor).isActive = true
        currentPrice.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        currentPrice.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
