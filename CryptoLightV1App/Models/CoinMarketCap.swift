//
//  CoinMarketCap.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 03/08/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import Foundation

struct CoinMarketCap: Decodable {
    var symbol: String?
    var price_usd: String?
}
