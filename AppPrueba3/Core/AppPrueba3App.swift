//
//  AppPrueba3App.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 18/11/25.
//

import SwiftUI
import FirebaseCore

@main
struct AppPrueba3App: App {
    init () {
        FirebaseApp.configure()
    }

    @StateObject private var themeManager = ThemeManager(
        designTokenService: FirebaseDesignTokenService()
    )

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(themeManager)
        }
    }
}
