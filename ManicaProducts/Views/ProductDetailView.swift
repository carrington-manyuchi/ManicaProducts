//
//  ProductDetailView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(CartManager.self) var cartManager: CartManager
    let product: Product
    
    var body: some View {
        @Bindable var cartManager = cartManager
        ScrollView {
            VStack(alignment: .leading) {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                
                Group {
                    Text(product.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text(product.description)
                        .font(.subheadline)
                        .padding(.bottom, 15)
                    
                    Button {
                        cartManager.addToCart(product: product)
                        cartManager.addToCartAlert = true
                    } label: {
                        Text("Add to Cart")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .alert("Added To Cart", isPresented: $cartManager.addToCartAlert) {
                Button("Ok") {
                    
                }
            } message: {
                Text("You have added \(product.title) to your cart")
            }

        }
    }
}


#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts()[0])
        .environment(CartManager())
}

