//
//  TransactionsListView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI


struct TransactionsListView: View {
    @EnvironmentObject var icons: IconManager

    let transactions: [TransactionModel]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(transactions.indices, id: \.self) { index in
                
                TransactionRowView(transaction: transactions[index])
                    .environmentObject(icons)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)

                if index < transactions.count - 1 {
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(height: 1)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}


