//
//  SquareImageModifier.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/18.
//

import SwiftUI

extension Image {
    func squareImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 70)
    }
}

