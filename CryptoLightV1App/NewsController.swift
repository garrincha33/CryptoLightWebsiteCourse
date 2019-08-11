//
//  NewsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 05/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class NewsController: BaseListController {
    
    let cellId = "cellId"
    
    var newsItems = [
        NewsArticle(title: "Test1"),
        NewsArticle(title: "Test2"),
        NewsArticle(title: "Test3"),
        NewsArticle(title: "Test4"),
        NewsArticle(title: "Test5")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavBar()
        collectionView.register(CustomNewsControllerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)

    }
    
    //MARK:- collectionView functions
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomNewsControllerCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 10)
        
    }
}
