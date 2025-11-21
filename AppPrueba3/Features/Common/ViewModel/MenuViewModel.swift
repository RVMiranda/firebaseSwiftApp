//
//  MenuViewModel.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import Combine

final class MenuViewModel: ObservableObject {
    @Published var menuItems: [menuItem] = [
        menuItem(icon: "house.fill", title: "Información", destination: .home),
        menuItem(icon: "creditcard.fill", title: "Billetera", destination: .wallet),
        menuItem(icon: "chart.bar.doc.horizontal", title: "Estadisticas", destination: .analytics),
        menuItem(icon: "gearshape.fill", title: "Configuración", destination: .settings)
    ]
}
