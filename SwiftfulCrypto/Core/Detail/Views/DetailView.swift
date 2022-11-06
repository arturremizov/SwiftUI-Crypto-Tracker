//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 6.11.22.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coins[0])
    }
}
