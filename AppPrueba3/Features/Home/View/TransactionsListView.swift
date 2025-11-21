//
//  TransactionsListView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 20/11/25.
//

import SwiftUI


struct TransactionsListView: View {

    let transactions: [TransactionModel]

    var body: some View {
        VStack(spacing: 16) {
            ForEach(transactions) { tx in
                TransactionRowView(transaction: tx)
            }
        }
        .padding(.vertical, 8)
    }
}



