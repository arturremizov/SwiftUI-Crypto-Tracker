//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 27.10.22.
//

import Foundation
import UIKit
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var subscriptions: Set<AnyCancellable> = []
    
    init(coin: CoinModel) {
        self.coin = coin
        self.isLoading = true
        self.dataService = CoinImageService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoading = false
            }, receiveValue: {
                [weak self] in
                self?.image = $0
            })
            .store(in: &subscriptions)
    }
}
