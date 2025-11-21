//
//  HomeView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var theme: ThemeManager

    var body: some View {

        let bg = theme.home?.colors?["background"]
            .flatMap { theme.colors[$0] } ?? .blue

        let title = theme.home?.texts?["title"] ?? "NO TITLE?"

        ZStack {
            bg.ignoresSafeArea()

            Text(title)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

