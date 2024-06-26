//
//  PreviewData.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

struct PreviewData {
    static let course = Course(id: 123, category: CourseCategory.general, name: "iOS App Development", duration: "2:00 hr", imageUrl: "https://picsum.photos/id/1/500/500", tag: "Free", lessonsCount: 2, description: "Test", lessons: [Lesson(id: 123, title: "Test")])
    static let user = User(userId: 1, name: "Test", surname: "Name")

}
