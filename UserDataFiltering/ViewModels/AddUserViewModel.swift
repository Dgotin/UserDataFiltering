//
//  AddUserViewModel.swift
//  UserDataFiltering
//

import Foundation
import SwiftUI

@MainActor
final class AddUserViewModel: ObservableObject {
    // MARK: general data
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var gender: String = ""
    @Published var age: String = ""

    // MARK: adress data
    @Published var street: String = ""
    @Published var numberOfStreet: String = ""
    @Published var town: String = ""
    @Published var postcode: String = ""
    @Published var country: String = ""
    @Published var state: String = ""
    
    // MARK: birth data
    @Published var birthDay: String = ""
    @Published var birthTown: String = ""
    @Published var birthPostcode: String = ""
    @Published var birthState: String = ""
    @Published var birthCountry: String = ""
    
    internal func reset() {
        self.firstName = ""
        self.lastName = ""
        self.gender = ""
        self.age = ""
        self.street = ""
        self.numberOfStreet = ""
        self.town = ""
        self.postcode = ""
        self.country = ""
        self.state = ""
        self.birthDay = ""
        self.birthTown = ""
        self.birthPostcode = ""
        self.birthState = ""
        self.birthCountry = ""
    }
    
    internal func createUserData() -> UserData {
        let birthData = BirthData(birthday: self.birthDay, town: self.town, postcode: self.postcode, country: self.country, state: self.state)
        let adress = Adress(street: self.street, numberOfStreet: self.numberOfStreet, town: self.town, postcode: self.postcode, country: self.country, state: self.state)
        let data = UserData(firstName: self.firstName, lastName: self.lastName, gender: self.gender, age: self.age, birthData: birthData, adress: adress)
        return data
    }
}
