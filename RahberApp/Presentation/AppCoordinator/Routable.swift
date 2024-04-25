//
//  Routable.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
