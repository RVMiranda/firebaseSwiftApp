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

    @StateObject var theme = ThemeManager(provider: FirebaseTokenProvider())
    @StateObject var router = ViewRouter()
    @StateObject var icons = IconManager()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(theme)
                .environmentObject(router)
                .environmentObject(icons)
        }
    }
}
