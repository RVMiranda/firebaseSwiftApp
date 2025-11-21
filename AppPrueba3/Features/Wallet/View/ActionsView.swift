//
//  ActionsView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct ActionsView: View {
    let actions: [WalletAction]
        @EnvironmentObject var theme: ThemeManager

        var body: some View {

            HStack(spacing: 16) {
                ForEach(actions) { action in

                    let bg = theme.colors[action.color] ?? Color.gray.opacity(0.2)

                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(bg)
                            .frame(width: 95, height: 70)

                        Image(systemName: action.icon)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black.opacity(0.85))
                    }
                }
            }
        }
}
