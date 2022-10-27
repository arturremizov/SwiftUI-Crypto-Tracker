//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 27.10.22.
//

import Foundation
import UIKit
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage(urlString: coin.image)
    }
    
    private func getCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        imageSubscription = NetworkingManager.download(url: url)
            .map { data in
                UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] image in
                self?.image = image
                self?.imageSubscription?.cancel()
            })
    }
}
