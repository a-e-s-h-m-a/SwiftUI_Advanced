//
//  TabBarItem.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, favourites, profile, messages
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favourites: return "heart"
        case .profile: return "person"
        case .messages: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favourites: return "Favourites"
        case .profile: return "Profile"
        case .messages: return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return .red
        case .favourites: return .blue
        case .profile: return .green
        case .messages: return .orange
        }
    }
}
