//
//  CardCarouselView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI

struct CardCarouselView: View {
    let cards: [HomeCardModel]
        @EnvironmentObject var theme: ThemeManager

        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cards) { card in
                        CardItemView(card: card)
                    }
                }
                .padding(.vertical, 5)
            }
        }
}

