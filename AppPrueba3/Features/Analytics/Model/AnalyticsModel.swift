//
//  AnalyticsModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import SwiftUI

struct AnalyticsBar: Identifiable{
    let id : UUID = UUID()
    let month: String
    let value: Double
    let color: String
}

struct CategoryAnalytics: Identifiable {
    let id: UUID = UUID()
    let icon: String
    let name: String
    let amount: Double
}
