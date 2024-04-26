//
//  MockFetchAllCoursesUseCases.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation
@testable import RahberApp

import Combine

// Mock FetchStatementUseCase for testing
class MockFetchAllCoursesUseCases: FetchAllCoursesUseCase {

    let result: Result<CourseList, APIError>

    init(result: Result<CourseList, APIError>) {
        self.result = result
    }

    func execute() -> AnyPublisher<CourseList, APIError> {
        return result.publisher.eraseToAnyPublisher()
    }
}

extension MockFetchAllCoursesUseCases {
    static func success(with result: CourseList) -> MockFetchAllCoursesUseCases {
        return MockFetchAllCoursesUseCases(result: .success(result))
    }

    static func failure(error: APIError) -> MockFetchAllCoursesUseCases {
        return MockFetchAllCoursesUseCases(result: .failure(error))
    }
}
