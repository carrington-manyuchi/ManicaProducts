//
//  ContentView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/14.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeviewModel()
    fileprivate var NavigationBarview: some View {
        HStack {
            Spacer()
            Text("Manica Products App")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
        }
        .overlay(alignment: .trailing) {
            Button {
                //MARK: - TODO
            } label: {
                ZStack {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(.black)
                    ZStack {
                        Circle()
                        Text("1")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                    .offset(CGSize(width: 10, height: -10))
                }
            }
            .padding(.trailing)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBarview
                Image("banner")
                    .bannerImageStyle()
                HStack {
                    Text("Featured")
                        .font(.system(size: 15, weight: .semibold))
                    
                    Spacer()
                    NavigationLink {
                        ProductGridView()
                    } label: {
                        Text("View All")
                            .font(.system(size: 15, weight: .bold))
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.fetchProducts(filter: .isFeatured)) { product in
                            ProductRow(product: product)
                        }
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Highly Rated")
                        .font(.system(size: 15, weight: .semibold))
                    
                    Spacer()
                    NavigationLink {
                        ProductGridView()
                    } label: {
                        Text("View All")
                            .font(.system(size: 15, weight: .bold))
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.fetchProducts(filter: .highlyRated)) { product in
                            ProductRow(product: product)
                        }
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
