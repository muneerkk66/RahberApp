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
            HStack(spacing: 8) {
                if let icon {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                }
                Text(LocalizedStringKey(label))
            }
            .font(.title2.bold())
            .padding(.vertical, 12)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background {
                LinearGradient(gradient: Gradient(colors: [Color.primaryGreen, Color.green]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

            }
        }
    }
}
