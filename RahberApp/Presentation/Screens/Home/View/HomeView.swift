//
//  HomeView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        sceneView.onAppear {
            viewModel.handle(.loadAllCourses)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.handle(.onTapProfile)
                } label: {
                    Image(systemName: "person").resizable() .foregroundColor(.primaryGreen).frame(width: Dimensions.space20, height: Dimensions.space20)
                }
            }
        }.environmentObject(viewModel)
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
