//
//  ViewRouter.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import Foundation
import Combine

final class ViewRouter: ObservableObject {
    @Published var currentView: menuDestination = .home
    @Published var isMenuOpen: Bool = false
}
