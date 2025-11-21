//
//  WalletModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation

struct WalletAction: Identifiable {
    let id = UUID()
    let icon: String
    let color: String
}

struct WalletFavorite: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
}

struct WalletTransaction: Identifiable {
    let id = UUID()
    let name: String
    let time: String
    let amount: Double
    let avatar: String
}
