//
//  CourseView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
import SwiftUI
import NukeUI

struct CourseView: View {
    let course: Course?

    var body: some View {
        VStack(alignment: .leading) {
            header
            Spacer()
            footer
        }
        .frame(height: Dimensions.cardViewHight)
        .foregroundColor(.white)
        .padding(Dimensions.space12)
        .background(
            Color(.primaryGreen)
                .overlay(
                    RoundedRectangle(cornerRadius: Dimensions.space16)
                        .stroke(Color.secondary.opacity(0.5), lineWidth: 1.5)
                )
        )
        .cornerRadius(Dimensions.space16)
        .shadow(color: .gray, radius: Dimensions.space4, x: 0, y: Dimensions.space2)
        .padding(.horizontal, Dimensions.space20)
    }

    @ViewBuilder
    @MainActor
    private var header: some View {
        HStack(alignment: .top) {
            LazyImage(url: URL(string: (course?.imageUrl).orEmpty))
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
    }

    @ViewBuilder
    private var footer: some View {
        HStack(alignment: .bottom, spacing: Dimensions.space8) {

            Spacer()
            Text((course?.name).orEmpty)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: PreviewData.course)
    }
}
