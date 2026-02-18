//
//  PrimaryButtonStyle.swift
//  ManicaProducts
//
//  Created by Manyuchi, Carrington C on 2026/02/17.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 15, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 8))
    }
}

