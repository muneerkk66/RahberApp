//
//  CourseListView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

struct CourseListView: View {
    @ObservedObject var viewModel: HomeViewModel
    let onTapLeader: (Course) -> Void

    var body: some View {
        GeometryReader { _ in
            ScrollView {

                LazyVStack(alignment: .leading, spacing: Dimensions.space20) {
                    ForEach(viewModel.courseList) { course in
                        CourseView(course: course)
                            .onTapGesture {
                                onTapLeader(course)
                            }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(UIColor.secondarySystemBackground))
        }

    }
}

#Preview {
    CourseListView(viewModel: Resolver.shared.resolve(HomeViewModel.self), onTapLeader: {_ in })
}
