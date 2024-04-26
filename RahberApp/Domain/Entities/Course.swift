//
//  CourseData.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

enum CourseCategory: Int {
    case general = 1
    case technology = 2
    case social = 3

    var description: String {
        switch self {
        case .general:
            return "General"
        case .technology:
            return "Technology"
        case .social:
            return "Social"
        }
    }
}

struct Course: Hashable, Identifiable {
    let id: Int
    let category: CourseCategory
    let name: String
    let duration: String
    let imageUrl: String
    let tag: String
    let lessonsCount: Int
    let description: String
    let lessons: [Lesson]
}

extension Course {
    // TODO: this can be improved using String catalog plurals
    func getLessonCountTitle() -> String {
        return String(describing: "\(lessonsCount) Lessons")
    }

    func isEnrolled(courseIds: Set<Int>) -> Bool {
        return courseIds.contains(id)
    }
}
