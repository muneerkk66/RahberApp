//
//  CourseService.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Combine

protocol CourseService {
    @discardableResult
    func fetchAllCourses(
    ) -> AnyPublisher<CoursesResponse, APIError>
}
