//
//  MockResponse.swift
//  RahberAppTests
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation
@testable import RahberApp
struct MockResponse {
    static let coursesResponse = CoursesResponse(
        userId: 1,
        name: "Test",
        surname: "",
        courses: [course]
    )

    static let course = CourseResponse(courseId: 12, category: 1, name: "Test", url: "", duration: "23h", tag: "123", description: "123", lessons: [lesson])
    static let lesson = Lesson(id: 123, title: "Test")

}
