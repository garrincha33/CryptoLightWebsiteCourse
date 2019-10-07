//
//  CoinsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 03/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class CoinsController: BaseListController {
    
    let cellId = "cellId"
    let url = FULL_COINS
    
    var items = [
    
        CoinMarketCap(symbol: "BTC", price_usd: "3045"),
        CoinMarketCap(symbol: "XRP", price_usd: "2045"),
        CoinMarketCap(symbol: "ETH", price_usd: "1045"),
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavBar()
        collectionView.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        collectionView.register(CustomCoinControllerCell.self, forCellWithReuseIdentifier: cellId)
        fetchCoins()
        
    }
    
    //MARK:- collection view functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCoinControllerCell
        cell.symbol.text = items[indexPath.row].symbol
        cell.currentPrice.text = items[indexPath.row].price_usd
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 70)
    }
    
    fileprivate func fetchCoins() {
        
        AF.request(url).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("please contact coinAPI unable to retrieve", err)
                return
            }
            
            guard let data = dataResponse.data else {return}
 
            do {
                
                let searchResult =  try
                    JSONDecoder().decode([CoinMarketCap].self, from: data)
                for _ in searchResult {
                    self.items = searchResult
                    self.collectionView.reloadData()
                }
                
            } catch let err {
                print("failed to decode", err)
            }
            
            
        }
        
        
    }
}
