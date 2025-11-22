//
//  BalanceHeaderView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct BalanceHeaderView: View {

    @EnvironmentObject var theme: ThemeManager

    let balance: Double
    let lastWeekChange: Double

    var body: some View {

        let titleColor =
            theme.wallet?.colors?["subtitle"]
                .flatMap { theme.colors[$0] }
            ?? Color.white.opacity(0.7)

        let amountColor =
            theme.wallet?.colors?["primaryText"]
                .flatMap { theme.colors[$0] }
            ?? Color.white

        let trendColor =
            theme.wallet?.colors?["trendPositive"]
                .flatMap { theme.colors[$0] }
            ?? Color.green

        VStack(alignment: .leading, spacing: 8) {

            // 🔥 Texto dinámico desde Firebase
            Text(theme.wallet?.texts?["title"] ?? "Total Balance")
                .foregroundColor(titleColor)
                .font(.system(size: 16, weight: .medium))

            HStack(alignment: .bottom, spacing: 6) {

                // 🔥 Cantidad con color dinámico
                Text("$\(String(format: "%.2f", balance))")
                    .foregroundColor(amountColor)
                    .font(.system(size: 42, weight: .bold))

                Image(systemName: "eye")
                    .foregroundColor(.white.opacity(0.5))
            }

            HStack(spacing: 6) {

                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundColor(trendColor)

                // 🔥 Texto dinámico desde JSON
                Text("\(lastWeekChange)% \(theme.wallet?.texts?["lastWeek"] ?? "last week")")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 14))
            }
        }
    }
}
