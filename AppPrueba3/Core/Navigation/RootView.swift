//
//  RootView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import Combine
import SwiftUI

struct RootView: View {

    @EnvironmentObject var theme: ThemeManager
    @EnvironmentObject var router: ViewRouter

    var body: some View {

        let bg = theme.home?.colors?["background"]
            .flatMap { theme.colors[$0] } ?? Color(hex: "#020626")

        ZStack {
            Group {
                switch router.currentView {
                case .home:
                    HomeView()
                case .wallet:
                    WalletView()
                case .analytics:
                    AnalyticsView()
                case .settings:
                    Text("Settings (placeholder)")
                        .foregroundColor(.white)
                }
            }
            .background(bg.ignoresSafeArea())
            .offset(x: router.isMenuOpen ? 230 : 0)
            .scaleEffect(router.isMenuOpen ? 0.90 : 1)
            .animation(.spring(response: 0.35, dampingFraction: 0.85),
                       value: router.isMenuOpen)

            MenuView(isOpen: $router.isMenuOpen, currentView: $router.currentView)
                .environmentObject(router)

        }
    }
}
