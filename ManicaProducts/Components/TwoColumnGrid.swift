//
//  TwoColumnGrid.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI


struct TwoColumnGrid<Content: View> :View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                content()
            }
        }
    }
}

