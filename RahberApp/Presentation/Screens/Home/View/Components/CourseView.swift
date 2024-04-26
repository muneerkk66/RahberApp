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

        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                header
                footer
            }
            .frame(height: Dimensions.cardViewHight)
            .foregroundColor(.white)
            .background(
                Color(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: Dimensions.space16)
                            .stroke(Color.secondary.opacity(0.5), lineWidth: 1.5)
                    )
            )
            .cornerRadius(Dimensions.space16)
            .shadow(color: .gray, radius: Dimensions.space4, x: 0, y: Dimensions.space2)
            .padding(.horizontal, Dimensions.space20)

            CapsuleText(text: (course?.tag).orEmpty).padding(.horizontal, Dimensions.space30).padding(.top, Dimensions.space10)
        }
    }

    @MainActor
    @ViewBuilder
    private var header: some View {
        GeometryReader { geometry in
            LazyImage(url: URL(string: (course?.imageUrl).orEmpty))
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }

    }

    @ViewBuilder
    private var footer: some View {
        VStack(alignment: .leading) {
            title
            subtitle
        }.frame(height: Dimensions.space50)
        .padding()
    }

    private var title: some View {
        Text((course?.name).orEmpty)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.black)
    }

    @ViewBuilder
    private var subtitle: some View {
        HStack(alignment: .center) {
            Image(systemName: "doc.on.doc").resizable() .foregroundColor(.primaryGreen).frame(width: Dimensions.space20, height: Dimensions.space20)
            Text((course?.getLessonCountTitle()).orEmpty)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "clock").resizable() .foregroundColor(.primaryGreen).frame(width: Dimensions.space20, height: Dimensions.space20)
            Text((course?.duration).orEmpty)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.gray)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: PreviewData.course)
    }
}
