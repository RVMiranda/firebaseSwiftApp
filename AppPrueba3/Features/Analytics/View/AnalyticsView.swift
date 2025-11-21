//
//  AnalyticsView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct AnalyticsView: View {
    
    @EnvironmentObject var theme: ThemeManager
    @StateObject var viewModel = AnalyticsViewModel()
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 25) {
                
                // HEADER
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Menu {
                        Button("Monthly") { viewModel.selectedPeriod = "Monthly" }
                        Button("Weekly") { viewModel.selectedPeriod = "Weekly" }
                        Button("Yearly") { viewModel.selectedPeriod = "Yearly" }
                    } label: {
                        HStack {
                            Text(viewModel.selectedPeriod)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                        .background(Color(hex: "#E4E7FF"))
                        .cornerRadius(14)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
                
                
                // TITLES
                Text("Debit Card")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                
                Text(theme.analytics?.texts?["title"] ?? "Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                
                // BAR CHART
                BarChartView(bars: viewModel.bars)
                    .environmentObject(theme)
                
                
                // INCOME / OUTCOME
                HStack {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(theme.analytics?.texts?["income"] ?? "Total Income")
                            .foregroundColor(.white)
                        Text("$2,927.50")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                        Label("12.7% last week", systemImage: "arrow.up.right")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(theme.analytics?.texts?["outcome"] ?? "Total Outcome")
                            .foregroundColor(.white)
                        Text("$528.20")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                        Label("8.5% last week", systemImage: "arrow.down.right")
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                    }
                }
                
                
                // CATEGORIES TITLE
                HStack {
                    Text("Categories")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    Text("View All")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                }
                
                
                // HORIZONTAL CATEGORY LIST
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.categories) { item in
                            CategoryCardView(item: item)
                                .environmentObject(theme)
                        }
                    }
                }
                
                
            }
            .padding()
        }
        .background(theme.colors["bgBody"]?.ignoresSafeArea())
    }
}
