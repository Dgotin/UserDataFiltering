//
//  BackendManagerError.swift
//  UserDataFiltering
//

import Foundation

enum BackendManagerError: Error {
    case generalError(_ message: String)
    case httpError(_ message: String)
}
