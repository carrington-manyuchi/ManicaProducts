//
//  ContentView.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/14.
//

import SwiftUI

struct HomeView: View {
    @Environment(FavoritesManager.self) var favoritesManager: FavoritesManager
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
                    
                        Text("1")
                            .foregroundStyle(.white)
                            .font(.system(size: 12))
                            .frame(width: 18, height: 18)
                            .background(Circle().fill(Color.red))
                            .offset(x: 10, y: -10)
                }
            }
            .padding(.trailing)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    NavigationBarview
                    Image("banner")
                        .bannerImageStyle()
                    HStack {
                        Text("Featured")
                            .font(.system(size: 15, weight: .semibold))
                        
                        Spacer()
                        NavigationLink {
                            ProductGridView(filter: .isFeatured)
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
                            ProductGridView(filter: .highlyRated)
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
                    
                    Button {
                        viewModel.showAllProducts = true
                    } label: {
                        Text("See Full Catalog")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal)

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $viewModel.showAllProducts) {
                ProductGridView(filter: .all)
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(FavoritesManager())
}
