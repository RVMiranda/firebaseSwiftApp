//
//  menuView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI
import Combine

struct MenuView: View {
    @EnvironmentObject var router: ViewRouter
    @Binding var isOpen: Bool
    @Binding var currentView: menuDestination
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        ZStack(alignment: .leading) {

                    if isOpen {
                        Color.black.opacity(0.35)
                            .ignoresSafeArea()
                            .onTapGesture { withAnimation { isOpen = false } }
                    }

                    HStack {
                        VStack(alignment: .leading, spacing: 30) {

                            // Ejemplo de botón del menú
                            Button {
                                withAnimation {
                                    router.currentView = .home
                                    isOpen = false
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "house.fill")
                                    Text("Home")
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            }

                            Button {
                                withAnimation {
                                    router.currentView = .wallet
                                    isOpen = false
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "creditcard.fill")
                                    Text("Wallet")
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            }

                            Spacer()
                        }
                        .padding()
                        .frame(width: 260)
                        .background(Color(hex: "#020626"))
                        .offset(x: isOpen ? 0 : -260)
                        .animation(.easeInOut, value: isOpen)

                        Spacer()
                    }
                }
            
    }
}

