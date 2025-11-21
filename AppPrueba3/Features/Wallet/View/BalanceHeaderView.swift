//
//  BalanceHeaderView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct BalanceHeaderView: View {
    let balance: Double
        let lastWeekChange: Double

        var body: some View {

            VStack(alignment: .leading, spacing: 8) {

                Text("Total Balance")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 16, weight: .medium))

                HStack(alignment: .bottom, spacing: 6) {

                    Text("$\(String(format: "%.2f", balance))")
                        .foregroundColor(.white)
                        .font(.system(size: 42, weight: .bold))

                    Image(systemName: "eye")
                        .foregroundColor(.white.opacity(0.5))
                }

                HStack(spacing: 6) {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundColor(.green)

                    Text("\(lastWeekChange)% last week")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14))
                }
            }
        }
}
