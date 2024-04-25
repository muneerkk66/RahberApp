//
//  Resolver.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
import Swinject

// Resolver is a singleton class that is responsible for injecting all dependencies in the app.
final class Resolver {

    static let shared = Resolver()

    private var container = Container()

    // This method is responsible for injecting all dependencies in the app.
    @MainActor func injectModules() {
        injectCoordinator()
        injectUtils()
        injectServices()
        injectDataSources()
        injectRepositories()
        injectUseCases()
        injectViewModels()

    }
    /// - Parameter type: The type of the dependency to be resolved.
    /// - Returns: The resolved dependency.
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

// MARK: - Injecting Utils -

extension Resolver {
    private func injectUtils() {
        container.register(APIClientLive.self) { _ in
            APIClientLive()
        }.inObjectScope(.container)

        container.register(RealmProvider.self) { _ in
            RealmProvider()
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Coordinator -

extension Resolver {
    private func injectCoordinator() {
        container.register(AppCoordinator.self) { _ in
            AppCoordinator()
        }.inObjectScope(.container)

        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator()
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Services -

extension Resolver {
    private func injectServices() {
        container.register(CourseServiceLive.self) { resolver in
            CourseServiceLive(apiClient: resolver.resolve(APIClientLive.self)!)
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting DataSources -

extension Resolver {
    private func injectDataSources() {
        container.register(CoursesLocalDataSource.self) { resolver in
            CoursesLocalDataSourceLive(realmProvider: resolver.resolve(RealmProvider.self)!)
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Repositories -

extension Resolver {

    private func injectRepositories() {
        container.register(CourseRepositoryLive.self) { resolver in
            CourseRepositoryLive(courseService: resolver.resolve(CourseServiceLive.self)!, localDataSource: resolver.resolve(CoursesLocalDataSource.self)!)
        }.inObjectScope(.container)

        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator()
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Use Cases -

extension Resolver {

    private func injectUseCases() {
        container.register(FetchAllCoursesUseCaseLive.self) { resolver in
            FetchAllCoursesUseCaseLive(courseRepository: resolver.resolve(CourseRepositoryLive.self)!)
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting ViewModels -

extension Resolver {

    @MainActor
    private func injectViewModels() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(coordinator: resolver.resolve(HomeCoordinator.self)!, fetchAllCoursesUseCase: resolver.resolve(FetchAllCoursesUseCaseLive.self)!)
        }
    }
}
