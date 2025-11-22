//
//  TransactionRowView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI
import Combine

struct TransactionRowView: View {
    let transaction: TransactionModel
    @EnvironmentObject var icons: IconManager


    var body: some View {

        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.20))
                    .frame(width: 52, height: 52)
                
                Image(transaction.iconName)
                    .resizable()
                    .scaledToFit()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)

                Text(transaction.subTitle)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Text(formattedAmount)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(transaction.isPositive ? .green : .red)
        }
        .padding(.vertical, 8)
    }

    private var formattedAmount: String {
        let amount = Double(transaction.amount)
        return transaction.isPositive ?
            String(format: "+$%.2f", amount) :
            String(format: "-$%.2f", amount)
    }
}

