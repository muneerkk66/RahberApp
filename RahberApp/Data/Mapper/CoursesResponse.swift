//
//  CoursesResponse.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
public struct CoursesResponse: Decodable {
    var userId: Int
    var name: String
    var surname: String
    var courses: [CourseResponse]

}

public struct CourseResponse: Decodable {
    var courseId: Int
    var name: String
    var url: String
    var duration: String
}
