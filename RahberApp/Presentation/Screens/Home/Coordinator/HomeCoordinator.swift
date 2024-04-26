//
//  HomeCoordinator.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

final class HomeCoordinator: Coordinator {
    enum Screen: Routable {
        case details(Course)
        case profile(User)

    }
    @Published var navigationPath = [Screen]()

}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showProfile(user: User) {
        navigationPath.append(.profile(user))
    }

    func showDetailView(course: Course) {
        navigationPath.append(.details(course))
    }
}
