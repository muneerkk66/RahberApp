//
//  Course+DomainMapper.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

extension CourseResponse {
    func toGeneralCourseDomain() -> Course {
        return Course(id: self.courseId, name: self.name, duration: self.duration, imageUrl: self.url)
    }

}
