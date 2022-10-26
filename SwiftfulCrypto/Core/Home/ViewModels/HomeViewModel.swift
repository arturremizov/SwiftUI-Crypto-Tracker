//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 26.10.22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(contentsOf: DeveloperPreview.instance.coins)
            self.portfolioCoins.append(contentsOf: DeveloperPreview.instance.coins)
        }
    }
}
