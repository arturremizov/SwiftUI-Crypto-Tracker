//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 24.10.22.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
        }
    }
}
