//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 26.10.22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] in
                self?.allCoins = $0
            }
            .store(in: &subscriptions)
    }
}
