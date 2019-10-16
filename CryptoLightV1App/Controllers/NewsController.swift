//
//  NewsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 05/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class NewsController: BaseListController, NewsDetailsWebControllerDelegate {
    
    func didSendUrl(article: NewsArticle) {
        let newsDetailController = NewsDetailsController()
        newsDetailController.delegate = self
        guard let urlToSend = article.url else {return}
        newsDetailController.newsArticles = article
        newsDetailController.articleUrl = urlToSend
        navigationController?.pushViewController(newsDetailController, animated: true)
    }
    
    
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let article = items[indexPath.row]
        didSendUrl(article: article)

    }
    
    fileprivate func fetchNews() {
        Service.shared.fetchArticlesFromApi { (newsArticle, err) in
            if let err = err {
                print("unable to list current news articles at this time", err)
                return
            }
            guard let articlesFromApi = newsArticle else {return}
            self.items = articlesFromApi
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
