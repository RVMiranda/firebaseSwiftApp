//
//  FavoritesView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 21/11/25.
//

import SwiftUI

struct FavoritesView: View {
    let favorites: [WalletFavorite]

        var body: some View {

            VStack(alignment: .leading, spacing: 10) {

                HStack {
                    Text("Favorites")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))

                    Spacer()

                    Text("Latest")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 18, weight: .medium))
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(favorites) { user in
                            VStack(spacing: 4) {

                                Image(user.avatar)
                                    .resizable()
                                    .frame(width: 58, height: 58)
                                    .clipShape(Circle())

                                Text(user.name)
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.system(size: 13))
                            }
                        }
                    }
                }
            }
        }
}
