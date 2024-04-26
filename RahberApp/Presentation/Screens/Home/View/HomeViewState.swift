//
//  HomeViewState.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
enum HomeViewEvent {
    case onTapCourse(Course)
    case onTapProfile
    case retryLoadAllCourses
    case loadAllCourses
    case onTapEnroll(courseId: Int)
}

enum HomeViewState: Comparable {
    case idle
    case isLoading
    case finished
    case error(String)
}
