//
//  BackendManagerProtocol.swift
//  UserDataFiltering
//

import Foundation

protocol BackendManagerProtocol {
    /// Simple example of a fake backend call
    func getUserData(of url: String, with body: Encodable?) async throws -> [UserData]
}
