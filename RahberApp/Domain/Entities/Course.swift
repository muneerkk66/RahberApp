//
//  CourseData.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
struct Course: Hashable, Identifiable {
    let id: Int
    let name: String
    let duration: String
    let imageUrl: String
    let tag: String
    let lessonsCount: Int
}

extension Course {
    // TODO: this can be improved using String catalog plurals
    func getLessonCountTitle() -> String {
        return String(describing: "\(lessonsCount) Lessons")
    }
}
