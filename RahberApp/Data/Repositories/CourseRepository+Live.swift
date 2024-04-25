//
//  CourseRepository+Live.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
import Combine

final class CourseRepositoryLive: CourseRepository {

    private var localDataSource: CoursesLocalDataSource
    private let courseService: CourseService

    init(courseService: CourseService, localDataSource: CoursesLocalDataSource) {
        self.localDataSource = localDataSource
        self.courseService = courseService
    }

    // TODO: Optimise data loading by initially fetching from local storage before integrating with the actual API. This will reduce loading times. Background tasks can then fetch remote data and update the database, ensuring the latest data is displayed to the user.

    // Use localDataSource.fetchAllCourses() to retrieve data from the database.

    // Additionally, consider implementing CoursesRemoteDataSource for handling service calls.

    func loadAllCourses() -> AnyPublisher<CourseList, APIError> {
        return courseService
            .fetchAllCourses()
            .map {[weak self] result -> CourseList in
                let general = result.courses.map {$0.toGeneralCourseDomain()}
                // Save Data in DB
                self?.saveAllCourses(response: result)

                let list =  CourseList(general: general)
                return list

            }.eraseToAnyPublisher()
    }

    func saveAllCourses(response: CoursesResponse) {
        Task {
            let model = CourseListModel(entity: response)
            await localDataSource.saveAllCourses(model)
            LogDebug("StatementResponse saved successful")
        }

    }
}
