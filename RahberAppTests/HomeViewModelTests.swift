//
//  HomeViewModelTests.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation

import XCTest
@testable import RahberApp

@MainActor
class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockFetchAllCoursesUseCases: MockFetchAllCoursesUseCases!
    var sortPersonalisedCourseUseCase: MockSortPersonalisedCourseUseCase!
    var homeCoordinator: MockHomeCoordinator!

    override func setUp() {
        super.setUp()
        homeCoordinator = MockHomeCoordinator()
        sortPersonalisedCourseUseCase = MockSortPersonalisedCourseUseCase()

        viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.success(with: MockResponse.courseList), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockFetchAllCoursesUseCases = nil
        homeCoordinator = nil
        sortPersonalisedCourseUseCase = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.viewState, .idle)
        XCTAssertEqual(viewModel.courseList.count, 0)
    }

    func testRetry() throws {
        let exp = XCTestExpectation(description: "TestRetryLoadStatement")
        XCTAssertEqual(viewModel.courseList.count, 0)
        viewModel.handle(.retryLoadAllCourses)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let courses = try XCTUnwrap(viewModel.courseList)
            XCTAssertGreaterThan(courses.count, 0)

        } else {
            XCTFail("Test Failed: retryLoadStatement")
        }

    }

    func testFetchStatementSuccess() throws {
        let exp = XCTestExpectation(description: "TestFetchStatementSuccess")
        viewModel.fetchAllCourses()
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let courses = try XCTUnwrap(viewModel.courseList)
            XCTAssertGreaterThan(courses.count, 0)

        } else {
            XCTFail("Test Failed: FetchStatement Success")
        }
    }

    func testFetchStatementFailure() throws {
        let exp = XCTestExpectation(description: "TestFetchStatementFailure")
        viewModel = HomeViewModel(coordinator: homeCoordinator, fetchAllCoursesUseCase: MockFetchAllCoursesUseCases.failure(error: APIError.applicationError), sortPersonalisedCourseUseCase: sortPersonalisedCourseUseCase)

        viewModel.fetchAllCourses()
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(viewModel.courseList.count, 0)
        } else {
            XCTFail("Test Failed: FetchStatement Failure")
        }
    }

}
