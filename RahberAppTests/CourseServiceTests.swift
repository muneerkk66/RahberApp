//
//  CourseServiceTests.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation

import XCTest
@testable import RahberApp

final class CourseServiceTests: XCTestCase {
    var model: CourseServiceLive!
    override func setUpWithError() throws {
        model = CourseServiceLive(apiClient: MockAPIClient())

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAllCourses() throws {
        let result = try awaitPublisher(model.fetchAllCourses())
        XCTAssertTrue(try XCTUnwrap(result.courses.count) > 0)

        // Verify Domain Model
        let user = result.toUserDomain()
        XCTAssertNotNil(user.name)
        let course = try XCTUnwrap(result.courses.first)
        XCTAssertNotNil(course.name)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
