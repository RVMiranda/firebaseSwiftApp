//
//  menuView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI
import Combine

struct MenuView: View {
    @ObservedObject var viewModel = MenuViewModel()
    @Binding var isOpen: Bool
    @Binding var currentView: menuDestination
    
    var body: some View {
            ZStack(alignment: .leading) {

                // Background dimmer
                if isOpen {
                    Color.black.opacity(0.35)
                        .ignoresSafeArea()
                        .onTapGesture { withAnimation { isOpen = false } }
                }

                // Sidebar
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 30) {

                        // Avatar
                        HStack(spacing: 12) {
                            Image("profile_pic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Rafael Miranda")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)

                                Text("Cliente Premium")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.6))
                            }
                        }
                        .padding(.top, 40)

                        // Menu Items
                        ForEach(viewModel.menuItems) { item in
                            HStack(spacing: 16) {
                                Image(systemName: item.icon)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)

                                Text(item.title)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.white)

                                Spacer()
                            }
                            .padding(.vertical, 6)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    currentView = item.destination
                                    isOpen = false
                                }
                            }
                        }

                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .frame(width: 260)
                    .frame(maxHeight: .infinity)
                    .background(
                        LinearGradient(colors: [
                            Color(hex: "#020626"),
                            Color(hex: "#1B2141")
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .offset(x: isOpen ? 0 : -260)
                    .animation(.easeInOut(duration: 0.25), value: isOpen)

                    Spacer()
                }
            }
        }
}

