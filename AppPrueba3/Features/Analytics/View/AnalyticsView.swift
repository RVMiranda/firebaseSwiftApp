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

    var body: some View {

        let bgColor =
            theme.analytics?.colors?["background"]
                .flatMap { theme.colors[$0] }
            ?? Color(hex: "#020626")

        ZStack {

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 28) {

                    headerSection
                    titlesSection
                    BarChartView(bars: viewModel.bars)
                        .environmentObject(theme)

                    incomesSection
                    categoriesSection
                }
                .padding()
            }
            .background(bgColor.ignoresSafeArea())
            .offset(x: router.isMenuOpen ? 230 : 0)
            .scaleEffect(router.isMenuOpen ? 0.90 : 1)
            .animation(.spring(response: 0.35, dampingFraction: 0.85),
                       value: router.isMenuOpen)

            MenuView(isOpen: $router.isMenuOpen,
                     currentView: $router.currentView)
        }
    }
}

extension AnalyticsView {

    var headerSection: some View {

        HStack {

            Button {
                withAnimation { router.isMenuOpen.toggle() }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title2)
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
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(hex: "#E4E7FF"))
                .cornerRadius(theme.corner("medium"))
            }

            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
    }

    var titlesSection: some View {
        VStack(alignment: .leading, spacing: 4) {

            Text(theme.analytics?.texts?["cardType"] ?? "Debit Card")
                .foregroundColor(.white.opacity(0.8))
                .font(.system(size: 18))

            Text(theme.analytics?.texts?["title"] ?? "Statistics")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .bold))
        }
    }

    var incomesSection: some View {
        HStack {

            VStack(alignment: .leading, spacing: 4) {
                Text(theme.analytics?.texts?["income"] ?? "Income")
                    .foregroundColor(.white.opacity(0.8))

                Text("$2,927.50")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))

                Label("12.7% last week", systemImage: "arrow.up.right")
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
            }

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text(theme.analytics?.texts?["outcome"] ?? "Outcome")
                    .foregroundColor(.white.opacity(0.8))

                Text("$528.20")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))

                Label("8.5% last week", systemImage: "arrow.down.right")
                    .font(.system(size: 14))
                    .foregroundColor(.red)
            }
        }
    }

    var categoriesSection: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("Categories")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                Text("View All")
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
            }

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
}
