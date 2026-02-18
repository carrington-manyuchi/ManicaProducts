//
//  BannerImagerModifier.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/16.
//

import SwiftUI

extension Image {
    func bannerImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .clipped()
    }
}

