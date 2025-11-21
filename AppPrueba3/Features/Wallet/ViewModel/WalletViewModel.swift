//
//  WalletViewModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import Combine

final class WalletViewModel: ObservableObject {
    @Published var balance: Double = 48883.06
    @Published var lastWeekChange: Double = 16.3

    @Published var favorites: [WalletFavorite] = []
    @Published var actions: [WalletAction] = []
    @Published var transactions: [WalletTransaction] = []

    @Published var selectedFilter: WalletFilter = .all

    init() {
        loadData()
    }
    
    private func loadData() {

        favorites = [
            WalletFavorite(name: "Diego H.", avatar: "avatar1"),
            WalletFavorite(name: "Eduardo P.", avatar: "avatar2"),
            WalletFavorite(name: "Pablo E.", avatar: "avatar3")
        ]

        actions = [
            WalletAction(icon: "arrow.left", color: "bgBody"),
            WalletAction(icon: "arrow.up.right", color: "accent"),
            WalletAction(icon: "plus", color: "bgCard")
        ]

        transactions = [
            WalletTransaction(name: "Diego H.", time: "Hace 4 horas", amount: -50, avatar: "avatar3"),
            WalletTransaction(name: "Uber", time: "Hace 7 horas", amount: -18.4, avatar: "uber")
        ]
    }

}

enum WalletFilter: String, CaseIterable {
    case all = "Transacciones"
    case income = "Recibido"
    case outcome = "Enviado"
}
