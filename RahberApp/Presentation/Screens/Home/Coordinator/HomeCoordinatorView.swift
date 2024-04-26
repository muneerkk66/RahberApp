//
//  HomeCoordinatorView.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @ObservedObject private var coordinator: HomeCoordinator = Resolver.shared.resolve(HomeCoordinator.self)
    @StateObject var viewModel: HomeViewModel = Resolver.shared.resolve(HomeViewModel.self)
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            HomeView().environmentObject(viewModel)
                .navigationDestination(for: HomeCoordinator.Screen.self) {
                    destination($0)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(height: Dimensions.space30)
                            .clipped()
                    }
                }
        }.accentColor(.primaryGreen)
    }

    @ViewBuilder
    private func destination(_ screen: HomeCoordinator.Screen) -> some View {
        switch screen {
        case .details(let course):
            CourseDetailView(course: course).environmentObject(viewModel)
        case .profile:
            ProfileView().environmentObject(viewModel)
        }
    }
}
