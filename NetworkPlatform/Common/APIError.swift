//
//  APIError.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}
