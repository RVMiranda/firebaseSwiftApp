//
//  FirebaseTokenProvider.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import FirebaseDatabase

final class FirebaseTokenProvider: TokenProvider {

    private let ref = Database.database().reference()

    func observeTokens(_ handler: @escaping (Result<AppConfig, Error>) -> Void) {

        print("FirebaseTokenProvider -> Observing root...")

        ref.observe(.value) { snapshot in

            if !snapshot.exists() {
                print("Snapshot DOES NOT exist")
                return
            }

            guard let value = snapshot.value else {
                print("Snapshot has no value")
                return
            }

            do {
                let data = try JSONSerialization.data(withJSONObject: value)
                let config = try JSONDecoder().decode(AppConfig.self, from: data)

                print("FirebaseTokenProvider -> Received config:")
                print("Home title:", config.screens.home.texts?["title"] ?? "nil")

                handler(.success(config))

            } catch {
                print("ERROR decoding AppConfig:", error)
                handler(.failure(error))
            }
        }
    }
}
