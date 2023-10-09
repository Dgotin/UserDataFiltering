//
//  FakeApi.swift
//  UserDataFiltering
//

import Foundation

class FakeApi {
    static func getUserData(_ url: URL) async throws -> ([UserData], HTTPURLResponse) {
        try? await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return ([UserData.defaultData()], response)
    }
}

class FakeURLSession {
    static let shared = FakeURLSession()
    
    /// Some fake data function for simulation
    func data(for urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse) {
        guard let url = urlRequest.url else {
            let url = try! URL("someUrl", strategy: .url)
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let emptyData: [UserData] = []
            let data = try JSONEncoder().encode(emptyData)
            return (data, response)
        }

        do {
            let userData = try await FakeApi.getUserData(url)
            let data = try JSONEncoder().encode(userData.0)
            let response = userData.1
            return (data, response)
        } catch {
            throw error
        }
    }
}
