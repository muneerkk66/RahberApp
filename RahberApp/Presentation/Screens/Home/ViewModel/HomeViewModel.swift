//
//  HomeViewModel.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinatorProtocol
    private let fetchAllCoursesUseCase: FetchAllCoursesUseCase
    private let sortPersonalisedCourseUseCase: SortPersonalisedCourseUseCase

    @Published var courseList: [Course] = []
    @Published var user: User?
    @Published var enrolledIds = Set<Int>()
    @Published var viewState: HomeViewState = .idle
    private var disposables = Set<AnyCancellable>()

    init(coordinator: HomeCoordinatorProtocol, fetchAllCoursesUseCase: FetchAllCoursesUseCase, sortPersonalisedCourseUseCase: SortPersonalisedCourseUseCase) {
        self.coordinator = coordinator
        self.fetchAllCoursesUseCase = fetchAllCoursesUseCase
        self.sortPersonalisedCourseUseCase = sortPersonalisedCourseUseCase
    }

    @MainActor
    public func handle(_ event: HomeViewEvent) {
        switch event {
        case .loadAllCourses, .retryLoadAllCourses:
            fetchAllCourses()
        case .onTapCourse(let course):
            coordinator.showDetailView(course: course)
        case .onTapEnroll(let courseId):
            enroll(courseId: courseId)
        case .onTapProfile:
            guard let user else {
                return
            }
            coordinator.showProfile()

        }
    }

    func fetchAllCourses() {
        viewState = .isLoading
        fetchAllCoursesUseCase
            .execute()
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    viewState = .error(error.localizedDescription)
                    break
                case .finished:
                    viewState = .finished
                    break
                }
            }, receiveValue: { [weak self] results in
                guard let self = self else { return }
                let values = sortPersonalisedCourseUseCase.execute(courses: results.general, enrolledIds: enrolledIds)
                courseList = values
                user = results.user
            })
            .store(in: &disposables)
    }

    func enroll(courseId: Int) {
        enrolledIds.insert(courseId)
    }
}
