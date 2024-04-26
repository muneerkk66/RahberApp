//
//  MockCoursesLocalDataSource.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation
@testable import RahberApp

struct MockCoursesLocalDataSource: CoursesLocalDataSource {
    func fetchAllCourses() async -> CourseListModel? {
        return nil
    }

    func saveAllCourses(_ object: CourseListModel) async {

    }
}
