//
//  CustomNewControllerCell.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 05/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit
import SDWebImage

class CustomNewsControllerCell: UICollectionViewCell {
    
    var titleContainer: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "dummyImage"))
//        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    var item: NewsArticle? {
        
        didSet {
            
            headerLable.text = item?.title
            
            guard let images = item?.urlToImage else {return}
            print("count \(images.count)")
            print("image string \(images)")
            guard let url = URL(string: images) else {return}
            titleContainer.sd_setImage(with: url, completed: nil)
            
        }
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleContainer)
        titleContainer.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 330, height: 160)
        
        addSubview(headerLable)
        headerLable.anchor(top: safeAreaLayoutGuide.topAnchor, left: titleContainer.leftAnchor, bottom: nil, right: titleContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
