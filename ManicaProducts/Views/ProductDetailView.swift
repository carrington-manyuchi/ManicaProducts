//
//  ProductDetailView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
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
                        
                    } label: {
                        Text("Add to Cart")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}


#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts()[0])
}

