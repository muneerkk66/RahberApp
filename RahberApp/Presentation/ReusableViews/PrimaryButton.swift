//
//  PrimaryButton.swift
//  RahberApp
//
//  Created by Muneer K K on 26/04/2024.
//

import SwiftUI

struct PrimaryButtonView: View {
    let icon: String?
    let label: String
    let action: () -> Void

    init(
        label: String,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: Dimensions.space8) {
                if let icon {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: Dimensions.space28, height: Dimensions.space28)
                }
                Text(LocalizedStringKey(label))
            }
            .font(.title2.bold())
            .padding(.vertical, Dimensions.space12)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, maxHeight: Dimensions.space50)
            .background {
                LinearGradient(gradient: Gradient(colors: [Color.primaryGreen, Color.green]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .clipShape(RoundedRectangle(cornerRadius: Dimensions.space20))

            }
        }
    }
}
