//
//  FirebaseDesingTokenService.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import FirebaseDatabase

/*protocol FirebaseDesignTokenService {
    func observeConfig(_ onUpdate: @escaping (Result<AppConfig, Error>) -> Void)
}

final class FirebaseDesingTokenServiceImpl: DesignTokenService {
    private let ref = Database.database().reference()
    
    func observeConfig(_ onUpdate: @escaping (Result<AppConfig, Error>) -> Void) {
        ref.child("desingConfig").observe(.value) { snapshot in
            guard let value = snapshot.value else {
                return
            }
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: ["primaryColor": "red"], options: [])
            let config = try JSONDecoder().decode(AppConfig.self, from: data)
            onUpdate(.success(config))
        }
        catch {
            onUpdate(.failure(error))
        }
    }
}
*/
final class FirebaseDesignTokenService: DesignTokenService {
    func observeConfig(_ handler: @escaping (Result<AppConfig, Error>) -> Void) {
        // TODO: Implement Firebase Remote Config or Firestore listener here.
        // For now, emit a basic default config once.
        let theme = ThemeConfig(
            colors: [
                "primary": "#5D5FEF",
                "background": "#FFFFFF",
                "textPrimary": "#111111"
            ],
            typography: [:]
        )
        let screens = ScreenList(
            home: ScreenConfig(
                colors: ["background": "primary"],
                fonts: nil,
                texts: ["title": "All Cards"]
            ),
            analytics: ScreenConfig(colors: nil, fonts: nil, texts: nil),
            wallet: ScreenConfig(colors: nil, fonts: nil, texts: nil)
        )
        let config = AppConfig(theme: theme, screens: screens)
        handler(.success(config))
    }
}

