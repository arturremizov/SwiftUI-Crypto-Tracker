//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 10.11.22.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
