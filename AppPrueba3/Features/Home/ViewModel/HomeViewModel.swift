//
//  HomeViewModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var cards: [HomeCardModel] = []
    @Published var transactions: [TransactionModel] = []
    
    init()
    {
        loadMockData()
    }
    
    private func loadMockData(){
        self.cards = [
            HomeCardModel(lastDigits: "3267", owner: "Rafael Miranda", type: "Debito", expirationDate: "07/30", color: "primary"),
            HomeCardModel(lastDigits: "4567", owner: "Rafael Miranda", type: "Credito", expirationDate: "07/30", color: "bgCard"),
            
        ]
        
        self.transactions = [
            TransactionModel(title: "Spotify", subTitle: "Hace 4 horas", amount: 99, iconName: "spotify", isPositive: false),
            TransactionModel(title: "De Diego H", subTitle: "Ayer", amount: 150, iconName: "darren", isPositive: true)
        ]
    }
}
