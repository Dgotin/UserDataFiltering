//
//  Adress.swift
//  UserDataFiltering
//

struct Adress: Codable, Hashable {
    let street: String
    let numberOfStreet: String?
    let town: String
    let postcode: String
    let country: String
    let state: String
}
