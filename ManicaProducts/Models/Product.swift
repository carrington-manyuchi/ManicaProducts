//
//  Product.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/14.
//

import SwiftUI


struct Product: Identifiable, Decodable {
    let id: String
    let title: String
    let description: String
    let price: Int
    let rating: Double
    let image: String
    let isFeatured: Bool
    
    var displayPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let price = numberFormatter.string(from: price as NSNumber)
        return price ?? "R0.00"
    }
    
    
    var displayRating: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        let rating = numberFormatter.string(from: rating as NSNumber)
        return rating ?? "No rating"
    }
}

extension Product: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

