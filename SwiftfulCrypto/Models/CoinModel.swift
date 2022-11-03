//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 24.10.22.
//

import Foundation

// CoinGecko API info
/*
 URL:
     https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON RESPONSE
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 19358.05,
     "market_cap": 371375050347,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 406442714889,
     "total_volume": 29078055447,
     "high_24h": 19634.72,
     "low_24h": 19152.98,
     "price_change_24h": 200.13,
     "price_change_percentage_24h": 1.04463,
     "market_cap_change_24h": 4325777522,
     "market_cap_change_percentage_24h": 1.17853,
     "circulating_supply": 19188131,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -71.96222,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 28448.74981,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-10-24T13:01:34.120Z",
     "sparkline_in_7d": {
       "price": [
         19454.14655117412,
         19515.480952537582,
       ]
     },
     "price_change_percentage_24h_in_currency": 1.0446312427100015
   }
  */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Double?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    var currentHoldings: Double?
    
    func updateHoldings(amount: Double) -> CoinModel {
        var coinModel = self
        coinModel.currentHoldings = amount
        return coinModel
    }
    
    var currentHoldingValue: Double {
        (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

extension CoinModel: Equatable {
    
    static func == (lhs: CoinModel, rhs: CoinModel) -> Bool {
        lhs.id == rhs.id
    }
}
