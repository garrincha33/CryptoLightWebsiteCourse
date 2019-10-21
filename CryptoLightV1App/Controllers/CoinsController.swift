//
//  CoinsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 03/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class CoinsController: BaseListController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let cellId = "cellId"
    let url = FULL_COINS
    
    var items = [CoinMarketCap]()
    var itemsCopy = [CoinMarketCap]()

    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavBar()
        collectionView.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        collectionView.register(CustomCoinControllerCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        fetchCoins()
    
    }
    
    fileprivate func setupSearchBar() {
        
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "enter the name of your currency"
        searchController.searchBar.tintColor = UIColor.rgb(red: 51, green: 212, blue: 128)
    }
    
    fileprivate func doSearch() {
        if let search = searchController.searchBar.text {
            items = (search.isEmpty) ? itemsCopy : itemsCopy.filter({$0.id?.localizedCaseInsensitiveContains(search) == true})
        }
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doSearch()
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        doSearch()
    }
    //MARK:- collection view functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCoinControllerCell
        cell.item = items[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 70)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = CoinsDetailsController()
        let coins = items[indexPath.row]
        controller.items = coins
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    fileprivate func fetchCoins() {
        Service.shared.fetchCoinsFromApi { (coins) in
            for _ in coins {
                self.items = coins
                self.itemsCopy = coins
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
