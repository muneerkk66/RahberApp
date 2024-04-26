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
        courses: [courseResponse]
    )
    static let user = User(userId: 1, name: "Test", surname: "Name")

    static let courseResponse = CourseResponse(courseId: 12, category: 1, name: "Test", url: "", duration: "23h", tag: "123", description: "123", lessons: [lesson])
    static let lesson = Lesson(id: 123, title: "Test")
    static let course = Course(id: 123, category: CourseCategory.general, name: "iOS App Development", duration: "2:00 hr", imageUrl: "https://picsum.photos/id/1/500/500", tag: "Free", lessonsCount: 2, description: "Test", lessons: [Lesson(id: 123, title: "Test")])

    static let courseList = CourseList(user: user, general: [course])

}
