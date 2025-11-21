//
//  ThemeManager.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import SwiftUI

final class ThemeManager: ObservableObject {
    @Published var colors: [String: UIColor] = [:]
    @Published var typography: [String: Typographystyle] = [:]
    
    @Published var homeConfig: ScreenConfig?
    @Published var analyticsConfig: ScreenConfig?
    @Published var walletConfig: ScreenConfig?
    
    private let desingTokenService: DesignTokenService
    
    init(desingtokenService: DesingTokenService){
        self.desingTokenService = desingtokenService
        
        self.colors = [
            "primary": Color(hex: "#5D5FEF"),
            "accent": Color(hex:"#FFB800")
        ]
        
        listenRemoteConfig()
    }
    
    private func listenRemoteConfig(){
        desingTokenServic.observeConfig { [weak self] (result) in
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
        
        colors = config.theme.colors.reduce(into: [:]) { dict, pair in
            dict[pair.key] = Color(hex: pair.value)
        }

        typography = config.theme.typography

        homeConfig      = config.screens.home
        analyticsConfig = config.screens.analytics
        walletConfig    = config.screens.wallet
    }
}
