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
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage(urlString: coin.image, imageName: coin.id)
    }
    
    private func getCoinImage(urlString: String, imageName: String) {
        if let image = fileManager.getImage(imageName: imageName, folderName: folderName) {
            self.image = image
        } else {
            downloadCoinImage(urlString: urlString, imageName: imageName)
        }
    }
    
    private func downloadCoinImage(urlString: String, imageName: String) {
        guard let url = URL(string: urlString) else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        imageSubscription = NetworkingManager.download(url: url)
            .map { data in
                UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] image in
                guard let self = self, let image else { return }
                self.image = image
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: image, imageName: imageName, folderName: self.folderName)
            })
    }
}
