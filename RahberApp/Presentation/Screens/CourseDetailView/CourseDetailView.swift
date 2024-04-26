//
//  CourseDetailView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI
import NukeUI

struct CourseDetailView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    let course: Course
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        headerView
                        detailView
                        LessonListView(course: course).frame(width: proxy.size.width, height: proxy.size.height)
                    }
                }
                .background(Color(UIColor.secondarySystemBackground))

                if !course.isEnrolled(courseIds: viewModel.enrolledIds) {
                    PrimaryButtonView(label: "button.enrol") {
                        viewModel.handle(.onTapEnroll(courseId: course.id))
                    }.padding(.horizontal, Dimensions.space20)
                    .frame(maxWidth: .infinity)
                }

            }.background(Color(UIColor.secondarySystemBackground))
        }
    }

    @MainActor
    @ViewBuilder
    private var headerView: some View {
        StickyHeader {
            LazyImage(url: URL(string: course.imageUrl))
                .aspectRatio(contentMode: .fit)
                .clipped()
                .overlay( VStack {
                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                }
                .frame(maxWidth: .infinity),
                alignment: .bottom )
        }
    }

    @ViewBuilder
    private var detailView: some View {
        VStack(alignment: .leading) {
            Text(course.name)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
            subtitle
            description
        }.padding(.horizontal, Dimensions.space20).offset(y: -Dimensions.space20)
    }

    @ViewBuilder
    private var subtitle: some View {
        HStack(alignment: .bottom) {
            Image(systemName: "doc.on.doc").resizable() .foregroundColor(.white).frame(width: Dimensions.space20, height: Dimensions.space20)
            Text(course.getLessonCountTitle())
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white)

            Image(systemName: "clock").resizable() .foregroundColor(.white).frame(width: Dimensions.space20, height: Dimensions.space20)
            Text(course.duration)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white)

        }
    }

    @ViewBuilder
    private var description: some View {
        Text(course.description)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .lineLimit(2)
            .truncationMode(.tail)
    }

}

#Preview {
    CourseDetailView(course: PreviewData.course)
}
