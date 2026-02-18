//
//  ManicaProductsApp.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/14.
//

import SwiftUI

@main
struct ManicaProductsApp: App {    
    @State var favoritesManager = FavoritesManager()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorites")
                    }
            }
            .environment(favoritesManager)
            .preferredColorScheme(.light)
        }
    }
}
