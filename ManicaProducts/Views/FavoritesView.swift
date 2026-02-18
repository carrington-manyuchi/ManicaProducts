//
//  FavoritesView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(FavoritesManager.self) var favoritesManager: FavoritesManager
    
    fileprivate func FavoriteProductRow(product: Product) -> some View {
        HStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text(product.description)
                    .lineLimit(2)
                    .font(.subheadline)
            }
            Button {
                favoritesManager.products.removeAll(where: { $0.id == product.id })
            } label: {
                Image(systemName: "heart.fill")
            }
        }
    }
    
    var body: some View {
        VStack {
            List(favoritesManager.products) { product in
                FavoriteProductRow(product: product)
            }
        }
        .overlay {
            if favoritesManager.products.count == 0 {
                Text("Nothing to see here")
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environment(FavoritesManager())
}
