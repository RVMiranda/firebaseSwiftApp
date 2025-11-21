//
//  BarChartView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct BarChartView: View {
    @EnvironmentObject var theme: ThemeManager
        let bars: [AnalyticsBar]
        
        var body: some View {
            HStack(alignment: .bottom, spacing: 22) {
                ForEach(bars) { bar in
                    BarItemView(bar: bar)
                }
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
        }
}
