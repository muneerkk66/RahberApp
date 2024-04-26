//
//  RahberAppTests.swift
//  RahberAppTests
//
//  Created by Muneer K K on 25/04/2024.
//

import XCTest
import SnapshotTesting
@testable import RahberApp

@MainActor
final class RahberAppTests: XCTestCase {

    var homeCoordinator: MockHomeCoordinator!
    var sortPersonalisedCourseUseCase: MockSortPersonalisedCourseUseCase!

    override func setUpWithError() throws {
        homeCoordinator = MockHomeCoordinator()
        sortPersonalisedCourseUseCase = MockSortPersonalisedCourseUseCase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultAppearanceWithSuccess ( ) {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let contentView = HomeCoordinatorView(viewModel: viewModel)

        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testDefaultAppearanceWithError ( ) {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let contentView = HomeCoordinatorView(viewModel: viewModel)
        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testHomeAppearanceWithError ( ) {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let contentView = HomeView().environmentObject(viewModel)
        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testHomeAppearanceWithSuccess ( ) {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let contentView = HomeView().environmentObject(viewModel)

        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testCourseListView( ) {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let contentView = CourseListView(viewModel: viewModel, onTapLeader: {_ in })
        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testErroView() {
        let errorView = ErrorView(errorMessage: "error") {}
        assertSnapshot(of: errorView.toVC(), as: .image)
    }

    func testProfileView() {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let view = ProfileView().environmentObject(viewModel)
        assertSnapshot(of: view.toVC(), as: .image)
    }

    func testCourseDetailView() {
        let viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
        let view = CourseDetailView(course: MockResponse.course).environmentObject(viewModel)
        assertSnapshot(of: view.toVC(), as: .image)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
