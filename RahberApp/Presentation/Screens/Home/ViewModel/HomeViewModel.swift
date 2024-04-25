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

    @Published var courseList: CourseList?
    @Published var viewState: HomeViewState = .idle
    private var disposables = Set<AnyCancellable>()

    init(coordinator: HomeCoordinatorProtocol, fetchAllCoursesUseCase: FetchAllCoursesUseCase) {
        self.coordinator = coordinator
        self.fetchAllCoursesUseCase = fetchAllCoursesUseCase
    }

    @MainActor
    func handle(_ event: HomeViewEvent) {
        switch event {
        case .loadAllCourses, .retryLoadAllCourses:
            fetchAllCourses()
        case .onTapCourse(let course):
            coordinator.showDetailView(course: course)
        }
    }

    func fetchAllCourses() {
        viewState = .isLoading
        fetchAllCoursesUseCase
            .execute()
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
                courseList = results
            })
            .store(in: &disposables)
    }
}
