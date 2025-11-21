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

                                // 🔥 LISTA AUTO-GENERADA DEL VIEWMODEL
                                ForEach(viewModel.menuItems) { item in
                                    Button {
                                        withAnimation {
                                            router.currentView = item.destination
                                            currentView = item.destination
                                            isOpen = false
                                        }
                                    } label: {
                                        HStack(spacing: 12) {
                                            Image(systemName: item.icon)
                                                .font(.system(size: 20))
                                            Text(item.title)
                                                .font(.system(size: 20, weight: .medium))
                                        }
                                        .foregroundColor(.white)
                                        .padding(.vertical, 5)
                                    }
                                }

                                Spacer()
                            }
                            .padding(.top, 60)
                            .padding(.horizontal, 20)
                            .frame(width: 260)
                            .background(Color(hex: "#020626"))
                            .offset(x: isOpen ? 0 : -260)
                            .animation(.easeInOut, value: isOpen)

                            Spacer()
                        }
                }
            
    }
}

