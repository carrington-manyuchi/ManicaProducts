//
//  ProductGridView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/16.
//

import SwiftUI

struct ProductGridView: View {
    
    @State var viewModel: ProductGridViewModel
    
    init(filter: ProductFilter) {
        self.viewModel = ProductGridViewModel(filter: filter)
    }
    
    var body: some View {
        HStack {
            TwoColumnGrid {
                ForEach(viewModel.products) { product in
                    ProductRow(product: product)
                }
            }
        }
    }
}

#Preview {
    ProductGridView(filter: .all)
}
