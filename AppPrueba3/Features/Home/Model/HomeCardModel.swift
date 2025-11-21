//
//  HomeCardModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation

struct HomeCardModel: Identifiable {
    let id: UUID = UUID()
    let lastDigits: String
    let owner: String
    let type: String
    let expirationDate: String
    let color: String
}
