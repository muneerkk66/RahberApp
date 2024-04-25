//
//  HomeCoordinator.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

final class HomeCoordinator: Coordinator {
    enum Screen: Routable {
        case details(String)
    }
    @Published var navigationPath = [Screen]()

}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showDetailView(name: String) {
        navigationPath.append(.details(name))
    }
}
