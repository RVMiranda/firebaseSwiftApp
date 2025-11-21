//
//  CardItemView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI

struct CardItemView: View {

    let card: HomeCardModel
    @EnvironmentObject var theme: ThemeManager

    var body: some View {

        let cardColor = theme.colors[card.color] ?? Color(hex: "#5D5FEF")

        ZStack(alignment: .topLeading) {

            RoundedRectangle(cornerRadius: 28)
                .fill(cardColor)
                .frame(width: 260, height: 165)

            VStack(alignment: .leading, spacing: 10) {

                HStack {
                    Text("**** \(card.lastDigits)")
                        .font(.body)
                        .foregroundColor(.white)

                    Spacer()

                    Circle()
                        .fill(Color.white)
                        .frame(width: 22, height: 22)
                }

                Spacer()

                Text(card.type)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white.opacity(0.7))

                HStack {
                    Text(card.owner)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)

                    Spacer()

                    Text(card.expirationDate)
                        .font(.system(size: 12))
                        .foregroundColor(Color.white.opacity(0.7))
                }
            }
            .padding(20)
        }
        .frame(width: 260, height: 165)
    }
}

