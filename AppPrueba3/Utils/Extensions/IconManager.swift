//
//  IconManager.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import SwiftUI
import Combine

struct LocalIconsFile: Codable {
    let icons: LocalIconSet
}

struct LocalIconSet: Codable {
    let avatars: [LocalIcon]
    let apps: [LocalIcon]
    let categories: [LocalIcon]
}

struct LocalIcon: Codable, Identifiable {
    let id: String
    let name: String
    let image_name: String
}

final class IconManager: ObservableObject {
    @Published var avatars: [LocalIcon] = []
    @Published var apps: [LocalIcon] = []
    @Published var categories: [LocalIcon] = []

    init() {
        loadJSON()
    }

    private func loadJSON() {
        guard let url = Bundle.main.url(forResource: "local_icons", withExtension: "json") else {
            print("ERROR: No se encontró local_icons.json")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(LocalIconsFile.self, from: data)

            avatars = decoded.icons.avatars
            apps = decoded.icons.apps
            categories = decoded.icons.categories

        } catch {
            print("Error al decodificar icons JSON:", error)
        }
    }

    // MARK: - Helper
    func image(for id: String) -> Image {
        // buscar en todos los grupos
        if let icon = (avatars + apps + categories).first(where: { $0.id == id }) {
            return Image(icon.image_name) // SIN .png — EXACTO A TU JSON
        }

        return Image(systemName: "questionmark.circle") // fallback
    }
    
    func get(_ id: String) -> UIImage {
        // buscar primero en apps
        if let icon = apps.first(where: { $0.id == id }) {
            return UIImage(named: icon.image_name) ?? UIImage(named: "placeholder")!
        }

        // buscar en avatars
        if let avatar = avatars.first(where: { $0.id == id }) {
            return UIImage(named: avatar.image_name) ?? UIImage(named: "placeholder")!
        }

        return UIImage(systemName: "questionmark.circle") ?? UIImage()

    }

}
