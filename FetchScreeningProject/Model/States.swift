//
//  States.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import Foundation

enum FetchType {
    case fetchIgnoringExistingData
    case useExistingData
}

// MARK: Errors
enum DashboardErrors: Error {
    case invalidURL
    case requestFailure
    case parseError
    case invalidResponse
    case invalidData
}

// TODO: Consolidate to single error type with variable to point out the file that had error
enum DetailsErrors: Error {
    case invalidURL
    case requestFailure
    case parseError
}
