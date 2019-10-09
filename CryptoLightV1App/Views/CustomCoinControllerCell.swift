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
        lable.translatesAutoresizingMaskIntoConstraints = false
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
        view.translatesAutoresizingMaskIntoConstraints = false
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
        titleContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleContainer.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(symbol)
        symbol.topAnchor.constraint(equalTo: topAnchor).isActive = true
        symbol.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        symbol.heightAnchor.constraint(equalTo: heightAnchor, constant: -10).isActive = true
        
        addSubview(currentPrice)
        currentPrice.leftAnchor.constraint(equalTo: symbol.rightAnchor, constant: 75).isActive = true
        currentPrice.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        currentPrice.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
