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
        lable.font = UIFont(name: "Poppins-Bold", size: 30)
        lable.textColor = .white
        //lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    var currentPrice: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Poppins-Light", size: 20)
        lable.textColor = .green
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    let titleContainer: UIImageView = {
        let view = UIImageView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()

    var item: CoinMarketCap? {
        didSet {
            symbol.text = item?.symbol
//            currentPrice.text = item?.price_usd
            currentPrice.text = "\(convertToCurrency((item?.price_usd)!))".trunc(length: 8)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleContainer)
        titleContainer.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 150, height: 100)
        
        addSubview(symbol)
        symbol.anchor(top: titleContainer.topAnchor, left: titleContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(currentPrice)
        currentPrice.anchor(top: titleContainer.topAnchor, left: symbol.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func convertToCurrency(_ number: String) -> String {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        
        let numberDouble = Double(number)!
        if numberDouble >= 1000 {
            
            let priceOfCoin: NSNumber = numberDouble as NSNumber
            let priceString = currencyFormatter.string(from: priceOfCoin)!
            return priceString
        }
        return "$\(number)"
    }
}
