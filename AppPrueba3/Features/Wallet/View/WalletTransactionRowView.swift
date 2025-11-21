//
//  TransactionRowView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct WalletTransactionRow: View {

    let tx: WalletTransaction

    var body: some View {

        HStack(spacing: 16) {

            Image(tx.avatar)
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(tx.name)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))

                Text(tx.time)
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 14))
            }

            Spacer()

            Text(tx.amount >= 0 ? "+$\(tx.amount)" : "-$\(abs(tx.amount))")
                .foregroundColor(tx.amount >= 0 ? .green : .red)
                .font(.system(size: 18, weight: .medium))
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(20)
    }
}
