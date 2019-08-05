//
//  CustomNewControllerCell.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 05/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class CustomNewsControllerCell: UICollectionViewCell {
    
    var titleContainer: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "dummyImage"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    var headerLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "HeaderLable"
        lable.backgroundColor = UIColor.rgb(red: 193, green: 19, blue: 57)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 16
        lable.clipsToBounds = true
        lable.layer.shadowRadius = 10
        lable.layer.shadowOpacity = 0.5
        lable.font = UIFont(name: "Poppins-Regular", size: 15)
        lable.textColor = UIColor.rgb(red: 200, green: 201, blue: 202)
        lable.numberOfLines = -1
        return lable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleContainer)
        titleContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        titleContainer.widthAnchor.constraint(equalToConstant: 330).isActive = true
        
        addSubview(headerLable)
        headerLable.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerLable.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        headerLable.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        headerLable.widthAnchor.constraint(equalToConstant: 100).isActive = true
        headerLable.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
