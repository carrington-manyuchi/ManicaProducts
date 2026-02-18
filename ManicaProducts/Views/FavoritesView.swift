//
//  FavoritesView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

struct FavoritesView: View {
    @State var viewModel = FavoritesViewModel()
    
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
             //MARK: - TODO
            } label: {
                Image(systemName: "heart.fill")
            }
        }
    }
    
    var body: some View {
        VStack {
            List(viewModel.products) { product in
                FavoriteProductRow(product: product)
            }
        }
    }
}

#Preview {
    FavoritesView()
}
