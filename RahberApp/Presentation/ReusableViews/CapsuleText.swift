//
//  CapsuleText.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .frame(minWidth: Dimensions.space80)
            .font(.headline)
            .padding(Dimensions.space4)
            .foregroundStyle(.white)
            .background(.primaryGreen)
            .clipShape(.capsule)
    }
}

#Preview {
    CapsuleText(text: "Text")
}
