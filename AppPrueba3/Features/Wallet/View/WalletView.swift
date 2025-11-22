//
//  WalletView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI
import Combine

struct WalletView: View {

    @EnvironmentObject var theme: ThemeManager
    @EnvironmentObject var router: ViewRouter
    @EnvironmentObject var icons: IconManager

    @StateObject var viewModel = WalletViewModel()

    @State private var isMenuOpen = false

    var body: some View {

        let bg = theme.wallet?.colors?["background"]
            .flatMap { theme.colors[$0] } ?? Color(hex: "#020626")

        ZStack {

            ScrollView(showsIndicators: false) {

                VStack(spacing: 28) {

                    topBar

                    BalanceHeaderView(
                        balance: viewModel.balance,
                        lastWeekChange: viewModel.lastWeekChange
                    )

                    FavoritesView(favorites: viewModel.favorites)

                    ActionsView(actions: viewModel.actions)

                    FilterTabsView(selected: $viewModel.selectedFilter)

                    // === LISTA DE TRANSACCIONES ===
                    VStack(spacing: 20) {
                        ForEach(viewModel.transactions) { tx in
                            WalletTransactionRow(tx: tx)
                                .environmentObject(theme)
                                .environmentObject(icons)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }
            .background(bg.ignoresSafeArea())
            .offset(x: isMenuOpen ? 230 : 0)
            .scaleEffect(isMenuOpen ? 0.92 : 1)
            .animation(.spring(), value: isMenuOpen)

            MenuView(
                isOpen: $isMenuOpen,
                currentView: .constant(.wallet)
            )
        }
    }
}

extension WalletView {

    // ============================
    // 🔵 TOP BAR
    // ============================

    var topBar: some View {

        let radius = theme.corner("large")

        return HStack {

            // === Botón del menú ===
            Button {
                withAnimation { isMenuOpen.toggle() }
            } label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Spacer()

            // === Selector de tarjeta ===
            HStack(spacing: 8) {
                Image(systemName: "creditcard")
                    .foregroundColor(.black)

                Text(theme.wallet?.texts?["cardType"] ?? "Debit Card")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)

                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: radius))
        }
    }
}
