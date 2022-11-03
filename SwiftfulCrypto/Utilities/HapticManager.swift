//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Artur Remizov on 3.11.22.
//

import Foundation
import UIKit

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(notificationType)
    }
}
