//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 7.11.22.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var subscripions: Set<AnyCancellable> = []
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { coinDetail in
                print("RECIEVED COIN DETAIL DATA!")
                print(coinDetail)
            }
            .store(in: &subscripions)
    }
}
