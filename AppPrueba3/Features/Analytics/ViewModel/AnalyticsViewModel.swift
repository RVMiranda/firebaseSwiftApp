//
//  AnalyticsViewModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import Combine

final class AnalyticsViewModel: ObservableObject {
    
    @Published var selectedPeriod: String = "Monthly"
    
    @Published var bars: [AnalyticsBar] = [
        AnalyticsBar(month: "Jan", value: 120, color: "accent"),
        AnalyticsBar(month: "Feb", value: 220, color: "primary"),
        AnalyticsBar(month: "Mar", value: 170, color: "accent"),
        AnalyticsBar(month: "Apr", value: 150, color: "accent")
    ]
    
    @Published var categories: [CategoryAnalytics] = [
        CategoryAnalytics(icon: "cup.and.saucer.fill", name: "Food", amount: 1247.23),
        CategoryAnalytics(icon: "car.fill", name: "Transport", amount: 384.00),
        CategoryAnalytics(icon: "bag.fill", name: "Shopping", amount: 947.00)
    ]
}
