//
//  BackendManager.swift
//  UserDataFiltering
//

import Foundation

struct BackendManager: BackendManagerProtocol {
    func getUserData(of url: String, with body: Encodable? = nil) async throws -> [UserData] {
        guard let url = try? URL(url, strategy: .url) else {
            throw BackendManagerError.generalError("URL could not be constructed")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpShouldHandleCookies = false

        if let body = body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(body)
        }

        do {
            let (data, response) = try await FakeURLSession.shared.data(for: request)
            let isOk = (200...299).contains(response.statusCode)

            if isOk {
                let result = try JSONDecoder().decode([UserData].self, from: data)
                return result
            } else {
                throw BackendManagerError.httpError("Response on fetching data was \(isOk.description)")
            }
        } catch {
            throw error
        }
    }
}
