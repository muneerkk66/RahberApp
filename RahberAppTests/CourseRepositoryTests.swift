//
//  CourseRepositoryTests.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation

import Combine
@testable import RahberApp
import XCTest

final class StatementRepositoryTests: XCTestCase {

    var model: CourseRepositoryLive!
    var mockCoursesLocalDataSource: MockCoursesLocalDataSource!
    var mockCourseService: MockCourseService!

    override func setUpWithError() throws {
        mockCourseService = MockCourseService()
        mockCoursesLocalDataSource = MockCoursesLocalDataSource()
        model = CourseRepositoryLive(courseService: mockCourseService, localDataSource: mockCoursesLocalDataSource)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAllCourses() throws {
        let result = try awaitPublisher(model.loadAllCourses())
        XCTAssertTrue(result.general.count > 0)
        XCTAssertNotNil(result.user.userId)

    }

    func testCheckModelDataFormat() throws {
        let result = try awaitPublisher(model.loadAllCourses())

        let course = try XCTUnwrap(result.general.first)
        XCTAssertTrue(course.getLessonCountTitle().contains("Lessons"))

        // User name check
        XCTAssertTrue(result.user.fullName().contains(result.user.name))
        let fullName = try XCTUnwrap(result.user.fullName())
        let nameList = fullName.components(separatedBy: " ")
        XCTAssertEqual(nameList.first, result.user.name)
        XCTAssertEqual(nameList.last, result.user.surname)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
