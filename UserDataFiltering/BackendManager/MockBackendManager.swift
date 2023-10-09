//
//  MockBackendManager.swift
//  UserDataFiltering
//

import Foundation

/// In a real situation, this would help to fetch data without needing a backend
struct MockBackendManager: BackendManagerProtocol {
    func getUserData(of url: String, with body: Encodable? = nil) async throws -> [UserData] {
        return UserData.testData()
    }
}
