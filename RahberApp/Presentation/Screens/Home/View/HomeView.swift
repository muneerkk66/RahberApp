//
//  HomeView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = Resolver.shared.resolve(HomeViewModel.self)

    var body: some View {
        sceneView.onAppear {
            viewModel.handle(.loadAllCourses)
        }
    }

    // TODO: Based on the actual API integration, this feature should be updated to include a loader view.
    @ViewBuilder
    private var sceneView: some View {
        switch viewModel.viewState {
        case .idle, .finished, .isLoading:
            CourseListView(viewModel: viewModel, onTapLeader: {course in
                viewModel.handle(.onTapCourse(course))
            })
        case .error(let error):
            ErrorView(errorMessage: error) {
                viewModel.handle(.retryLoadAllCourses)
            }
        }
    }
}

#Preview {
    HomeView()
}
