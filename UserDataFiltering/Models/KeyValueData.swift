//
//  KeyValueData.swift
//  UserDataFiltering
//

import Foundation

struct KeyValueData: Identifiable {
    let id = UUID()
    let key: String
    let value: String
}
