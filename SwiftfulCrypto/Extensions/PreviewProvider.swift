//
//  PreviewProvider.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 25.10.22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeViewModel = HomeViewModel()
    let coins: [CoinModel] = loadMockCoins()
}

private func loadMockCoins() -> [CoinModel] {
    guard
        let url = Bundle.main.url(forResource: "CoinModelsMock", withExtension: "json"),
        let data = try? Data(contentsOf: url) else { return [] }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let coins = try? decoder.decode([CoinModel].self, from: data)
    return coins ?? []
}
