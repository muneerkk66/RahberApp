//
//  SortPersonalisedCourse.swift
//  RahberApp
//
//  Created by Muneer K K on 26/04/2024.
//

import Foundation
protocol SortPersonalisedCourseUseCase {
    func execute(courses: [Course], enrolledIds: Set<Int> ) -> [Course]
}

final class SortPersonalisedCourseUseCaseLive: SortPersonalisedCourseUseCase {

    func execute(courses: [Course], enrolledIds: Set<Int> ) -> [Course] {
        // If no IDs are enrolled, just return the original courses as they are
        if enrolledIds.isEmpty {
            return courses
        }

        // Determine which categories have enrollments
        let enrolledCategories = Set(courses.filter { enrolledIds.contains($0.id) }.map { $0.category })

        // Return sorted courses, where enrolled categories come first, preserving internal order as much as possible
        return courses.enumerated().sorted { (a, b) in
            let isAEnrolledCategory = enrolledCategories.contains(a.element.category)
            let isBEnrolledCategory = enrolledCategories.contains(b.element.category)

            if isAEnrolledCategory && !isBEnrolledCategory {
                return true
            } else if !isAEnrolledCategory && isBEnrolledCategory {
                return false
            } else {
                // Maintain the original order for items in the same category condition
                return a.offset < b.offset
            }
        }.map { $0.element }
    }

}
