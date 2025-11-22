//
//  FilterTabsView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct FilterTabsView: View {
    @Binding var selected: WalletFilter

    var body: some View {
        HStack(spacing: 0) {
            ForEach(WalletFilter.allCases, id: \.self) { filter in

                Button {
                    withAnimation { selected = filter }
                } label: {
                    Text(filter.rawValue)
                        .font(.system(size: 16, weight: .medium))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(
                            selected == filter
                            ? Color.white
                            : Color.clear
                        )
                        .foregroundColor(selected == filter ? .black : .white.opacity(0.7))
                        .clipShape(Capsule())
                }
            }
        }
        .padding(6)
        .background(Color(hex: "#0A1633"))
        .clipShape(Capsule())
    }
}
