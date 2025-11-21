//
//  AnalyticsView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct AnalyticsView: View {
    
    @EnvironmentObject var theme: ThemeManager
    @EnvironmentObject var router: ViewRouter
    @StateObject var viewModel = AnalyticsViewModel()
    @State private var isMenuOpen = false
    
    var body: some View {
        
        ZStack {
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 25) {
                    
                    header
                    titles
                    barChart
                    incomeOutcome
                    categoriesHeader
                    categoriesList
                    
                }
                .padding()
            }
            .background(theme.colors["bgBody"].ignoresSafeArea())
            .offset(x: isMenuOpen ? 230 : 0)
            .scaleEffect(isMenuOpen ? 0.92 : 1)
            .animation(.spring(response: 0.35, dampingFraction: 0.85), value: isMenuOpen)
            
            // Menú lateral
            MenuView(
                isOpen: $isMenuOpen,
                currentView: .constant(.analytics)
            )
        }
    }
}

extension AnalyticsView {
    
    var header: some View {
        HStack {
            
            // Botón menú lateral
            Button {
                withAnimation {
                    isMenuOpen.toggle()
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Selector periodo
            Menu {
                Button("Monthly") { viewModel.selectedPeriod = "Monthly" }
                Button("Weekly")  { viewModel.selectedPeriod = "Weekly"  }
                Button("Yearly")  { viewModel.selectedPeriod = "Yearly"  }
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
            
            // Botón extra
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
    }
}

extension AnalyticsView {
    
    var titles: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Debit Card")
                .foregroundColor(.white)
                .font(.system(size: 18))
            
            Text(theme.analytics?.texts?["title"] ?? "Statistics")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .bold))
        }
    }
}


extension AnalyticsView {
    
    var barChart: some View {
        BarChartView(bars: viewModel.bars)
            .environmentObject(theme)
    }
}

extension AnalyticsView {
    
    var incomeOutcome: some View {
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
    }
}

extension AnalyticsView {
    
    var categoriesHeader: some View {
        HStack {
            Text("Categories")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            Text("View All")
                .font(.system(size: 14))
                .foregroundColor(.blue)
        }
    }
    
    var categoriesList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.categories) { item in
                    CategoryCardView(item: item)
                        .environmentObject(theme)
                }
            }
        }
    }
}

