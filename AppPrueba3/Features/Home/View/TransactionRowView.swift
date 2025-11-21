//
//  TransactionRowView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI

struct TransactionRowView: View {
    let transaction: TransactionModel

        var body: some View {

            HStack(spacing: 16) {

                Image(transaction.iconName)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.title)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)

                    Text(transaction.subTitle)
                        .font(.system(size: 14))
                        .foregroundColor(Color.white.opacity(0.6))
                }

                Spacer()

                Text(transaction.isPositive ? "+$\(Double(transaction.amount))" : "-$\(transaction.amount)")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(transaction.isPositive ? .green : .red)
            }
            .padding(16)
            .background(Color.white.opacity(0.05))
            .cornerRadius(20)
        }
}


