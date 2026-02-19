//
//  CartView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

struct CartView: View {
    @Environment(CartManager.self) var cartManager: CartManager
    
    fileprivate func CartRow(productInCart: ProductInCart) -> some View {
        HStack {
            Image(productInCart.product.image)
                .squareImageStyle()
            
            VStack(alignment: .leading) {
                Text(productInCart.product.title)
                    .font(.headline)
                
                Text(productInCart.product.displayPrice)
                    .font(.subheadline)
                
                Stepper("Quantity \(productInCart.quantity)") {
                    cartManager.addToCart(product: productInCart.product)
                } onDecrement: {
                    cartManager.removeFromCart(product: productInCart.product)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(cartManager.productsInCart) { productInCart in
                    CartRow(productInCart: productInCart)
                }
            }
            
            VStack {
                Divider()
                HStack {
                    Text("Total: \(cartManager.displayTotalCartQuantity) items")
                        .font(.body)
                    Spacer()
                    Text("\(cartManager.displayTotalCartPrice)")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
            }
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
