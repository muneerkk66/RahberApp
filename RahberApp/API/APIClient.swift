//
//  APIClient.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Combine

protocol APIClient {
	@discardableResult
	func request<T: Decodable>() -> AnyPublisher<T, APIError>
}

