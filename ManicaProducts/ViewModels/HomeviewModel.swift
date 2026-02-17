//
//  HomeviewModel.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/17.
//

import SwiftUI
import Observation

@Observable
class HomeviewModel {
    func fetchProducts(filter: ProductFilter) -> [Product] {
        switch filter {
            
        case .all:
            ProductsClient.fetchProducts()
        case .isFeatured:
            ProductsClient.fetchProducts().filter { $0.isFeatured }
        case .highlyRated:
            ProductsClient.fetchProducts().filter { $0.rating > 4 }
        }
    }
}
