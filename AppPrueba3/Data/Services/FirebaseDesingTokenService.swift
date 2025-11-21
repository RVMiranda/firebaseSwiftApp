//
//  FirebaseDesingTokenService.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation
import FirebaseDatabase

protocol FirebaseDesignTokenService {
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
