//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 29.10.22.
//

import Foundation
import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
