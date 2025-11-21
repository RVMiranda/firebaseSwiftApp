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
        let config = theme.homeConfig
        
        ZStack {
            (config?.colors?["background"])
                .flatMap{ theme.colors[$0]} ?? theme.colors["primary"] ?? .blue)
                .ignoresSafeArea(true)
            
            VStack(aligmnet: .leading, spacing: 16){
                Text(config.texts?["tittle"] ?? "All Cards")
                    .font(.system(size: 32, design: .bold))
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
