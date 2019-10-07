//
//  NewsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 05/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class NewsController: BaseListController {
    
    let cellId = "cellId"
    let url = FULL_HEADLINES
    
    var items = [NewsArticle]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavBar()
        collectionView.register(CustomNewsControllerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        
        fetchNews()

    }
    
    //MARK:- collectionView functions
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomNewsControllerCell
        cell.item = items[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 10)
        
    }
    
    fileprivate func fetchNews() {
        AF.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("please contact APINews", err)
                return
            }
            
            guard let data = dataResponse.data else {return}
//            let dummyString = String(data: data, encoding: .utf8)
//            print(dummyString ?? "")
            
            do {
                
                let searchResult =  try
                    JSONDecoder().decode(SearchResults.self, from: data)
                print("Result Count:-", searchResult.totalResults)
                searchResult.articles.forEach { (article) in
                    print(article.title ?? "", article.url ?? "")
                }
                
                self.items = searchResult.articles
                self.collectionView.reloadData()
                
                

            } catch let decodeErr {
                print("unable to decode", decodeErr)
            }
        }
    }
    
    
    
    
    struct SearchResults: Decodable  {
        let totalResults: Int
        let articles: [NewsArticle]
    }
    
}
