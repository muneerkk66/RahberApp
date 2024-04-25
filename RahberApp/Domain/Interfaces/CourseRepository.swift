//
//  CourseRepository.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
import Combine

protocol CourseRepository {
    func loadAllCourses() -> AnyPublisher<CourseList, APIError>

    func saveAllCourses(response: CoursesResponse)
}
