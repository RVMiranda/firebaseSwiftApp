//
//  ThemeManager.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import SwiftUI
import Combine

// Protocol that provides remote design tokens/config updates
protocol DesignTokenService {
    func observeConfig(_ handler: @escaping (Result<AppConfig, Error>) -> Void)
}

final class ThemeManager: ObservableObject {
    // Color tokens available by key
    @Published var colors: [String: Color] = [:]
    @Published var typography: [String: Typographystyle] = [:]

    @Published var homeConfig: ScreenConfig?
    @Published var analyticsConfig: ScreenConfig?
    @Published var walletConfig: ScreenConfig?

    private let designTokenService: DesignTokenService

    init(designTokenService: DesignTokenService) {
        self.designTokenService = designTokenService

        // Default colors to avoid empty UI before remote config arrives
        self.colors = [
            "primary": Color(hex: "#5D5FEF"),
            "accent": Color(hex: "#FFB800"),
            "background": Color(hex: "#FFFFFF"),
            "textPrimary": Color(hex: "#111111")
        ]

        listenRemoteConfig()
    }

    private func listenRemoteConfig() {
        designTokenService.observeConfig { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let config):
                    self?.apply(config: config)
                case .failure:
                    break
                }
            }
        }
    }

    private func apply(config: AppConfig) {
        // Map the theme colors into SwiftUI Color values
        colors = config.theme.colors.reduce(into: [:]) { dict, pair in
            dict[pair.key] = Color(hex: pair.value)
        }

        typography = config.theme.typography

        homeConfig      = config.screens.home
        analyticsConfig = config.screens.analytics
        walletConfig    = config.screens.wallet
    }
}

