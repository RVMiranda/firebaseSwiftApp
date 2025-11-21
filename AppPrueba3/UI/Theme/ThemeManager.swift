//
//  ThemeManager.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import SwiftUI
import Combine

final class ThemeManager: ObservableObject {
    @EnvironmentObject var theme: ThemeManager

    @Published var colors: [String: Color] = [:]
    @Published var typography: [String: Typographystyle] = [:]

    @Published var home: ScreenConfig?
    @Published var analytics: ScreenConfig?
    @Published var wallet: ScreenConfig?

    private let provider: TokenProvider

    init(provider: TokenProvider) {
        self.provider = provider
        listen()
    }

    private func listen() {

            provider.observeTokens { [weak self] result in
                DispatchQueue.main.async {

                    switch result {
                    case .success(let config):

                        print("🔥 ThemeManager.apply -> Title:", config.screens.home.texts?["title"] ?? "nil")

                        self?.colors = config.theme.colors.mapValues { Color(hex: $0) }
                        self?.typography = config.theme.typography

                        self?.home      = config.screens.home
                        self?.analytics = config.screens.analytics
                        self?.wallet    = config.screens.wallet

                    case .failure(let error):
                        print("❌ ThemeManager ERROR:", error)
                    }
                }
            }
        }
}

