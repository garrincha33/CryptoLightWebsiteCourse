//
//  APIService.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 11/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class Service {
    
    static let shared = Service()
    
    func fetchArticlesFromApi(completionHandler: @escaping ([NewsArticle]?, Error?) ->()) {
        
        let url = FULL_HEADLINES
        AF.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("unable to contact host", err.localizedDescription)
                return
            }
            
            guard let data = dataResponse.data else {return}
            
            do {
                let searchResult = try
                    JSONDecoder().decode(SearchResults.self
                        , from: data)
                print("Total Results:-", searchResult.totalResults)
                completionHandler(searchResult.articles, nil)
                
            } catch let error {
                
                completionHandler(nil, error)
                print("unable to decode", error)
                
            }
        }
    }
    
    
    func fetchCoinsFromApi(completionHandler: @escaping ([CoinMarketCap]) -> ()) {
        let url = FULL_COINS
        AF.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("unable to connect at this time", err)
                return
            }
            guard let data = dataResponse.data else {return}
            
            do {
                let searchResult = try
                    JSONDecoder().decode([CoinMarketCap].self, from: data)
                completionHandler(searchResult)
            } catch let err {
                print("unable to decode", err)
            }
            
        }
    }
}
