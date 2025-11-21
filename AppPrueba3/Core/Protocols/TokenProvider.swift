//
//  TokenProvider.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import Foundation

protocol TokenProvider{
    func observeTokens(_ handler: @escaping (Result<AppConfig, Error>) -> Void)
}
