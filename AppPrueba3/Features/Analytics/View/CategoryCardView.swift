//
//  CategoryCardView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct CategoryCardView: View {
    @EnvironmentObject var theme: ThemeManager
        let item: CategoryAnalytics
        
        var body: some View {
            VStack(spacing: 12) {
                
                Image(systemName: item.icon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
                    .background(theme.colors["primary"] ?? .blue)
                    .clipShape(Circle())
                
                Text(item.name)
                    .font(.system(size: 15))
                    .foregroundColor(Color.white.opacity(0.7))
                
                Text(String(format: "$%.2f", item.amount))
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 130, height: 150)
            .background(theme.colors["bgCard"])
            .cornerRadius(22)
        }
}
