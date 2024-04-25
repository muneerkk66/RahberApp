//
//  CourseService+Live.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Combine

final class CourseServiceLive {
    private var apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension CourseServiceLive: CourseService {
    func fetchStatement(
    ) -> AnyPublisher<CoursesResponse, APIError> {
        return apiClient.request()
    }
}
