//
//  AppConfig.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation

struct AppConfig: Codable {
    let theme: ThemeConfig
    let screens: ScreenConfig
}

struct ThemeConfig: Codable {
    let colors: [String: String]
    let typography: [String: Typographystyle]
}

struct ScreenConfig: Codable {
    let colors: [String: String]?
    let fonts: [String: String]?
    let texts: [String: String]?
}

struct Typographystyle: Codable {
    let fontFamily: String
    let fontSize: String
    let weight: String
}

struct ScreenList: Codable {
    let home: ScreenConfig
    let analytics: ScreenConfig
    let wallet: ScreenConfig
}
