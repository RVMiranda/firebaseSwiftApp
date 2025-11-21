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
                            titleRow
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
    var titleRow: some View {
        HStack(alignment: .center) {

            VStack(alignment: .leading, spacing: 4) {

                Text("Información")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))

                HStack(spacing: 4) {
                    Text(theme.home?.texts?["title"] ?? "Tarjetas")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)

                    Text("(\(viewModel.cards.count))")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white.opacity(0.35))
                }
            }
            Spacer()
            Button {
                // acción para nueva tarjeta
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.18))
                        .frame(width: 60, height: 60)

                    Image(systemName: "plus")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                }
                
            }
            .padding(10)
            .offset(y: 15)
        }
    }
}


extension HomeView {
    var headerSection: some View {
        HStack {
            Button {
                withAnimation { isMenuOpen.toggle() }
            } label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Spacer()

            HStack(spacing: 14) {

                Button {
                    withAnimation { notificationsEnabled.toggle() }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.12))
                            .frame(width: 40, height: 40)

                        Image(systemName: notificationsEnabled ? "bell.fill" : "bell")
                            .foregroundColor(notificationsEnabled ? .yellow : .white)

                        if notificationsEnabled {
                            Circle()
                                .fill(.red)
                                .frame(width: 10, height: 10)
                                .offset(x: 12, y: -12)
                                .transition(.scale)
                        }
                    }
                }

                Image("profile_pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())
            }
        }
    }
}


extension HomeView {
    private var transactionsSection: some View {

        VStack(alignment: .leading, spacing: 16) {
            HStack{
                Text("Actividad Reciente")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.7))
                Spacer()
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 30))
                    .foregroundColor(.white.opacity(0.8))
            }
            Text(theme.home?.texts?["latestActivity"] ?? "Tarjetas")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)

            TransactionsListView(transactions: viewModel.transactions)
        }
        .background(Color.white.opacity(0.08))
        .cornerRadius(20)
        
    }
}

#Preview {
    HomeView()
        .environmentObject(ThemeManager(provider: FirebaseTokenProvider()))
        .environmentObject(ViewRouter())
        .preferredColorScheme(.dark)
}
