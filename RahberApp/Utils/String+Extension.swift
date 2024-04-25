//
//  String+Extension.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation
extension Optional where Wrapped: StringProtocol {
    var orEmpty: String {
        switch self {
        case .some(let value):
            return String(value)
        case .none:
            return ""
        }
    }
}
