//
//  BarItemView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct BarItemView: View {
    @EnvironmentObject var theme: ThemeManager
        
        let bar: AnalyticsBar
        let maxHeight: CGFloat = 220
        
        var body: some View {
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(theme.colors[bar.color] ?? .gray)
                    .frame(width: 55, height: max(CGFloat(bar.value), 20))
                
                Text(bar.month)
                    .font(.system(size: 14))
                    .foregroundColor(Color.white.opacity(0.7))
            }
        }
}

