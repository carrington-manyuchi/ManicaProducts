//
//  CartManager.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI
import Observation

@Observable
class CartManager {
    var productsInCart: [ProductInCart] = []
    var addToCartAlert = false
    
    var displayTotalCartQuantity: Int {
        productsInCart.reduce(0) { $0 + $1.quantity }
    }
    
    func addToCart(product: Product) {
        if let index = productsInCart.firstIndex(where: { $0.product.id == product.id }) {
            productsInCart[index].quantity += 1
        } else {
            productsInCart.append(ProductInCart(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = productsInCart.firstIndex(where: { $0.product.id == product.id }) {
            if productsInCart[index].quantity > 1 {
                productsInCart[index].quantity -= 1
            } else {
                productsInCart.remove(at: index)
            }
        }
    }
    
    var displayTotalCartPrice: String {
        let totalPrice = productsInCart.reduce(0) { $0 + ($1.product.price * $1.quantity) }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalPrice as NSNumber) ?? "R0.00"
    }
}

