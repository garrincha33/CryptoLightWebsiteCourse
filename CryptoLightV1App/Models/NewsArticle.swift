//
//  NewsArticle.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 05/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import Foundation

struct NewsArticle: Decodable {
    var title: String?
    var url: String?
    var urlToImage: String?
}

 struct SearchResults: Decodable  {
     let totalResults: Int
     let articles: [NewsArticle]
 }
