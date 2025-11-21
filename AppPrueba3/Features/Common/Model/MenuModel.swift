//
//  MenuModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation

enum menuDestination {
    case home
    case wallet
    case analytics
    case settings
    
}

struct menuItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let destination: menuDestination
}
