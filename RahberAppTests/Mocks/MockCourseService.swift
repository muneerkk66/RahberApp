//
//  MockCourseService.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation
import Combine
@testable import RahberApp

struct MockCourseService: CourseService {

    func fetchAllCourses() -> AnyPublisher<CoursesResponse, APIError> {
        guard let fileURL = Bundle.main.url(forResource: AppEnvironment.development.jsonFile, withExtension: "json") else {
            return Fail(error: APIError.fileNotFound)
                .eraseToAnyPublisher()
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            return Just(jsonData)
                .decode(type: CoursesResponse.self, decoder: JSONDecoder())
                .mapError { _ in APIError.applicationError }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError.fileNotFound)
                .eraseToAnyPublisher()
        }
    }

}
