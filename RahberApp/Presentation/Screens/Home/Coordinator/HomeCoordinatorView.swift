//
//  HomeCoordinatorView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @ObservedObject private var coordinator: HomeCoordinator = Resolver.shared.resolve(HomeCoordinator.self)

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            HomeView()
                .navigationDestination(for: HomeCoordinator.Screen.self) {
                    destination($0)
                }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(height: Dimensions.space30)
                            .clipped()
                    }
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: HomeCoordinator.Screen) -> some View {
        switch screen {
        case .details(let course):
            CourseDetailView(course: course)
        }
    }
}