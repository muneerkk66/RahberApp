//
//  Course+DomainMapper.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

extension CourseResponse {
    func toGeneralCourseDomain() -> Course {
        return Course(id: self.courseId, category: CourseCategory(rawValue: category) ?? CourseCategory.general, name: self.name, duration: self.duration, imageUrl: self.url, tag: self.tag, lessonsCount: self.lessons.count, description: self.description, lessons: self.lessons)
    }
}

extension CoursesResponse {
    func toUserDomain() -> User {
        return User(userId: userId, name: name, surname: surname)
    }
}
