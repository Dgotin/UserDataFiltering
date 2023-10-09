//
//  BirthData.swift
//  UserDataFiltering
//

import Foundation

struct BirthData: Codable, Hashable {
    let birthday: String
    let town: String
    let postcode: String
    let country: String
    let state: String
}
