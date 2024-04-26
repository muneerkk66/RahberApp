//
//  MockSortPersonalisedCourseuseCase.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation

@testable import RahberApp
import Combine

// Mock SortLatencyListUseCase for testing
final class MockSortPersonalisedCourseUseCase: SortPersonalisedCourseUseCase {

    var mockResults: [Course] = []

    func execute(courses: [Course], enrolledIds: Set<Int>) -> [Course] {
        mockResults = courses
        return mockResults
    }

}
