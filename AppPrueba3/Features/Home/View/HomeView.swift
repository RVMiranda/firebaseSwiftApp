//
//  HomeView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var theme: ThemeManager
    @EnvironmentObject var router: ViewRouter
    @StateObject var viewModel = HomeViewModel()
    @State private var isMenuOpen = false
    @State private var currentScreen: menuDestination = .home
    @State private var notificationsEnabled = true

    var body: some View {

        let bg = theme.home?.colors?["background"]
            .flatMap { theme.colors[$0] } ?? Color(hex: "#020626")

        ZStack {

                    // ===== MAIN CONTENT =====
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 30) {

                            headerSection

                            CardCarouselView(cards: viewModel.cards)

                            transactionsSection
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                    .background(bg.ignoresSafeArea())
                    .offset(x: isMenuOpen ? 230 : 0)
                    .scaleEffect(isMenuOpen ? 0.90 : 1)
                    .animation(.spring(response: 0.35, dampingFraction: 0.85), value: isMenuOpen)

                    // ===== SIDE MENU =====
                    MenuView(
                        isOpen: $isMenuOpen,
                        currentView: $currentScreen
                    )
                    .environmentObject(router)
                }
            }
}

extension HomeView {
    private var headerSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Button {
                    withAnimation {
                        isMenuOpen.toggle()
                    }
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                }

                Spacer()

                HStack(spacing: 12) {
                    Button {
                        withAnimation(.spring()) {
                            notificationsEnabled.toggle()
                        }
                    } label: {

                        ZStack {

                            Circle()
                                .fill(Color.white.opacity(0.15))
                                .frame(width: 36, height: 36)

                            Image(systemName: notificationsEnabled ? "bell.fill" : "bell")
                                .foregroundColor(notificationsEnabled ? .yellow : .white)
                                .animation(.easeInOut, value: notificationsEnabled)

                            if notificationsEnabled {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                    .offset(x: 12, y: -12)
                                    .transition(.scale.combined(with: .opacity))
                            }
                        }
                    }
                    Image("profile_pic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 38, height: 38)
                        .clipShape(Circle())
                }
            }

            Text("Información")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white.opacity(0.7))

            HStack {
                Text("Tarjetas")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)

                Text("(2)")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color.white.opacity(0.3))
            }
        }
    }
}

extension HomeView {
    private var transactionsSection: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("Actividad Reciente")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white.opacity(0.7))

            Text("Transacciones")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)

            TransactionsListView(transactions: viewModel.transactions)
        }
    }
}
