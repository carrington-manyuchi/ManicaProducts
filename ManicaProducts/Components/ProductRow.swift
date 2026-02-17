//
//  ProductRow.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/17.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(
                    UnevenRoundedRectangle(
                        cornerRadii: .init(
                            topLeading: 8,
                            bottomLeading: 0,
                            bottomTrailing: 0,
                            topTrailing: 8
                        )
                    )
                )
            
            Group {
                Text(product.title)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(1)
                
                Text("\(product.displayPrice)")
                    .font(.system(size: 15))
                
                HStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.yellow)
                    
                    Text("\(product.displayRating)")
                        .font(.system(size: 14))
                }
            }
            .padding(.horizontal, 5)
            Spacer()
        }
        .frame(width: 150, height: 270)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: .lightGray).opacity(0.4), lineWidth: 1)
        }
        .overlay(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: "heart")
                
            }
            .padding(8)
            
        }
    }
}

#Preview {
    ProductRow(product: ProductsClient.fetchProducts()[0])
}
