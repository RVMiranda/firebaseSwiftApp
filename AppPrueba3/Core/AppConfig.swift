//
//  AppConfig.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation

struct AppConfig: Codable {
    let theme: ThemeConfig
    let screens: ScreenList
}

struct ThemeConfig: Codable {
    let colors: [String: String]
    let typography: [String: Typographystyle]

    enum CodingKeys: String, CodingKey { case colors, typography }

    init(colors: [String: String] = [:], typography: [String: Typographystyle] = [:]) {
        self.colors = colors
        self.typography = typography
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let colors = try container.decodeIfPresent([String: String].self, forKey: .colors) ?? [:]
        let typography = try container.decodeIfPresent([String: Typographystyle].self, forKey: .typography) ?? [:]
        self.init(colors: colors, typography: typography)
    }
}

struct ScreenConfig: Codable {
    let colors: [String: String]?
    let fonts: [String: String]?
    let texts: [String: String]?
}

struct Typographystyle: Codable {
    let fontName: String
    let fontSize: String
    let weight: String

    enum CodingKeys: String, CodingKey { case fontName, fontSize, weight }

    init(fontName: String = "System", fontSize: String = "14", weight: String = "regular") {
        self.fontName = fontName
        self.fontSize = fontSize
        self.weight = weight
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let fontName = try container.decodeIfPresent(String.self, forKey: .fontName) ?? "System"
        let fontSize = try container.decodeIfPresent(String.self, forKey: .fontSize) ?? "14"
        let weight = try container.decodeIfPresent(String.self, forKey: .weight) ?? "regular"
        self.init(fontName: fontName, fontSize: fontSize, weight: weight)
    }
}

struct ScreenList: Codable {
    let home: ScreenConfig
    let analytics: ScreenConfig
    let wallet: ScreenConfig

    enum CodingKeys: String, CodingKey { case home, analytics, wallet }

    init(home: ScreenConfig = ScreenConfig(colors: nil, fonts: nil, texts: nil),
         analytics: ScreenConfig = ScreenConfig(colors: nil, fonts: nil, texts: nil),
         wallet: ScreenConfig = ScreenConfig(colors: nil, fonts: nil, texts: nil)) {
        self.home = home
        self.analytics = analytics
        self.wallet = wallet
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let home = try container.decodeIfPresent(ScreenConfig.self, forKey: .home) ?? ScreenConfig(colors: nil, fonts: nil, texts: nil)
        let analytics = try container.decodeIfPresent(ScreenConfig.self, forKey: .analytics) ?? ScreenConfig(colors: nil, fonts: nil, texts: nil)
        let wallet = try container.decodeIfPresent(ScreenConfig.self, forKey: .wallet) ?? ScreenConfig(colors: nil, fonts: nil, texts: nil)
        self.init(home: home, analytics: analytics, wallet: wallet)
    }
}
