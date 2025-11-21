//
//  TransactionModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation

struct TransactionModel: Identifiable{
    let id: UUID = UUID()
    let title: String
    let subTitle: String
    let amount: Double
    let iconName: String
    let isPositive: Bool
}
