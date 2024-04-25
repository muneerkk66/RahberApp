//
//  Coordinator.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//
import Foundation

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}
