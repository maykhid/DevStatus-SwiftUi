//
//  Result.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/7/23.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String, T?)
    case loading

    var isSuccess: Bool {
        if case .success = self { return true }
        return false
    }

    var isFailure: Bool {
        if case .failure = self { return true }
        return false
    }

    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }

    var data: T? {
        switch self {
        case .success(let data):
            return data
        case .failure(_, let data):
            return data
        case .loading:
            return nil
        }
    }

    var errorMessage: String? {
        if case let .failure(message, _) = self {
            return message
        }
        return nil
    }
}
