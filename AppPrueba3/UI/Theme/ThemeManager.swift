//
//  ThemeManager.swift
//  AppPrueba3
//

import Foundation
import SwiftUI
import Combine

final class ThemeManager: ObservableObject {

    // MARK: - Published theme values
    @Published var colors: [String: Color] = [:]
    @Published var fonts: [String: TypographyConfig] = [:]
    @Published var radius: RadiusConfig = RadiusConfig(small: 8, medium: 16, large: 24, extra: 32)

    @Published var home: ScreenConfig?
    @Published var analytics: ScreenConfig?
    @Published var wallet: ScreenConfig?

    private var provider: TokenProvider
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    init(provider: TokenProvider) {
        self.provider = provider
        self.startObserving()
    }

    // MARK: - Listening to Firebase live changes
    private func startObserving() {

        provider.observeTokens { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let config):
                    print("ThemeManager -> Config received")
                    self?.apply(config: config)

                case .failure(let error):
                    print("ThemeManager ERROR ->", error.localizedDescription)
                }
            }
        }
    }

    // MARK: - Apply Config to Published Vars
    private func apply(config: AppConfig) {

        // COLORS
        var parsedColors: [String: Color] = [:]
        for (key, hex) in config.theme.colors {
            parsedColors[key] = Color(hex: hex)
        }
        self.colors = parsedColors

        // TYPOGRAPHY
        if let fontMap = config.theme.fonts {
            self.fonts = fontMap
        }

        // RADIUS
        if let rad = config.theme.radius {
            self.radius = rad
        }

        // SCREENS
        self.home = config.screens.home
        self.analytics = config.screens.analytics
        self.wallet = config.screens.wallet
    }

    // MARK: - Helpers to apply in Views

    func font(_ key: String) -> Font {
        guard let style = fonts[key] else { return .system(size: 16) }

        let size = CGFloat(style.size)

        switch style.weight.lowercased() {
        case "bold":      return .system(size: size, weight: .bold)
        case "semibold":  return .system(size: size, weight: .semibold)
        case "medium":    return .system(size: size, weight: .medium)
        default:          return .system(size: size, weight: .regular)
        }
    }

    func corner(_ key: String) -> CGFloat {
        switch key {
        case "small": return radius.small
        case "medium": return radius.medium
        case "large": return radius.large
        case "extra": return radius.extra
        default: return 14
        }
    }
}

