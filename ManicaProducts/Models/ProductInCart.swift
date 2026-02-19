//
//  ProductInCart.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

struct ProductInCart: Identifiable {
    var id: String {
        product.id
    }
    
    let product: Product
    var quantity: Int
}
