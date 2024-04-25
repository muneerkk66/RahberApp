//
//  FetchAllCoursesUseCase.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
import Combine

protocol FetchAllCoursesUseCase {
    func execute() -> AnyPublisher<CourseList, APIError>
}

final class FetchAllCoursesUseCaseLive: FetchAllCoursesUseCase {
    private var courseRepository: CourseRepository

    init(courseRepository: CourseRepository) {
        self.courseRepository = courseRepository
    }

    func execute() -> AnyPublisher<CourseList, APIError> {
        return courseRepository.loadAllCourses()
    }
}
