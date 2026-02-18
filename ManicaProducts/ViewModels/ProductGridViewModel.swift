//
//  ProductGridViewModel.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI
import Observation

@Observable
class ProductGridViewModel {
    let filter: ProductFilter
    
    var products: [Product] {
        switch filter {
        case .all:
            ProductsClient.fetchProducts()
        case .isFeatured:
            ProductsClient.fetchProducts().filter { $0.isFeatured }
        case .highlyRated:
            ProductsClient.fetchProducts().filter { $0.rating > 4 }
        }
    }
    
    init(filter: ProductFilter) {
        self.filter = filter
    }
}
