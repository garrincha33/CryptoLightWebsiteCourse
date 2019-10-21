//
//  CoinsDetailsController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 18/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class CoinsDetailsController: UIViewController {
    
    var coinsDetails = [CoinMarketCap]()
    
    
    //MARK:- APICall
    
    var items: CoinMarketCap? {
        didSet {
            
            navigationItem.title = items?.id
            cryptoTitleLable.text = items?.symbol
            priceChange24Change.text = "\("%")\(items?.percent_change_24h ?? "")"
            
            //logic for color coding
            if (priceChange24Change.text?.contains("-"))! {
                priceChange24Change.textColor = .red
            } else {
                priceChange24Change.textColor = .green
            }
            
            marketCapPrice.text = "\(convertToCurrency((items?.market_cap_usd)!))"
            currentPrice.text = "\(convertToCurrency((items?.price_usd)!))".trunc(length: 6)
            
            priceChange1Hour.text = "\("%")\(items?.percent_change_1h ?? "")"
            
            if (priceChange1Hour.text?.contains("-"))! {
                priceChange1Hour.textColor = .red
            } else {
                priceChange1Hour.textColor = .green
            }
        }
    }
    
    
    //MARK:- UISetup
    let backgroundContainer: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.gray
        view.layer.opacity = 0.1
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let cryptoTitleLable = UILabel(lines: 2, title: "CryptoTitle", font: UIFont(name: "Poppins-Light", size: 20)! , alignment: .center, color: .white)
    let priceChange24Title = UILabel(lines: 0, title: "24 Hour Price", font: UIFont(name: "Poppins-Light", size: 16)!, alignment: .center, color: .white)
    let priceChange24Change = UILabel(lines: 2, title: "24 Hour Price Change", font: UIFont(name: "Poppins-Light", size: 14)!, alignment: .center, color: .white)
    let marketCapTitle = UILabel(lines: 0, title: "Market Cap", font: UIFont(name: "Poppins-Light", size: 16)!, alignment: .center, color: .white)
    let marketCapPrice = UILabel(lines: 2, title: "Market Price", font: UIFont(name: "Poppins-Light", size: 14)!, alignment: .center, color: .white)
    let currentPriceTitle = UILabel(lines: 0, title: "Current Price", font: UIFont(name: "Poppins-Light", size: 16)!, alignment: .center, color: .white)
    let currentPrice = UILabel(lines: 2, title: "Current Price", font: UIFont(name: "Poppins-Light", size: 14)!, alignment: .center, color: .white)
    let priceChange1HourTitle = UILabel(lines: 0, title: "Last Hour Price", font: UIFont(name: "Poppins-Light", size: 16)!, alignment: .center, color: .white)
    let priceChange1Hour = UILabel(lines: 2, title: "Price Change", font: UIFont(name: "Poppins-Light", size: 14)!, alignment: .center, color: .white)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        setupUI()

    }
    
    fileprivate func stackViewCreator(with stack: UIStackView) -> UIStackView {
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }

    fileprivate func setupUI() {
        view.addSubview(backgroundContainer)
        backgroundContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 220, height: 400)
        view.addSubview(cryptoTitleLable)
        cryptoTitleLable.anchor(top: backgroundContainer.topAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        //implement stack view for handling price setup
        let stackView = UIStackView(arrangedSubviews: [priceChange24Title, priceChange24Change])
        let stackPrice = stackViewCreator(with: stackView)
        
        let stackViewMarketCap = UIStackView(arrangedSubviews: [marketCapTitle, marketCapPrice])
        let stackCap = stackViewCreator(with: stackViewMarketCap)
        
        let stackViewCurrentPrice = UIStackView(arrangedSubviews: [currentPriceTitle, currentPrice])
        let stackCurrent = stackViewCreator(with: stackViewCurrentPrice)
        
        let stackViewLastHour = UIStackView(arrangedSubviews: [priceChange1HourTitle, priceChange1Hour])
        let stackLastHour = stackViewCreator(with: stackViewLastHour)
        
        //create overall stackView
        let overallStackView = UIStackView(arrangedSubviews: [stackPrice, stackCap, stackCurrent, stackLastHour])
        view.addSubview(overallStackView)
        overallStackView.axis = .vertical
        overallStackView.distribution = .fillEqually
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.anchor(top: cryptoTitleLable.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 170, height: 170)
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
