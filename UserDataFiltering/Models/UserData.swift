//
//  UserData.swift
//  UserDataFiltering
//

import Foundation

struct UserData: Codable, Hashable, Identifiable {
    var id = UUID()
    let firstName: String
    let lastName: String
    let gender: String
    let age: String
    let birthData: BirthData
    let adress: Adress
}

// MARK: Static default and test data
extension UserData {
    static func defaultData() -> UserData {
        let defaultUser = UserData(firstName: "Foo", lastName: "Bar", gender: "Male", age: "9999",
                                   birthData: BirthData(birthday: "01.01.9999",
                                                   town: "Foo Town", postcode: "12345",
                                                   country: "Footasia", state: "Fookuhila"),
                                   adress: Adress(street: "Foostreet", numberOfStreet: "1", town: "Footown",
                                             postcode: "12345", country: "Footasia",
                                             state: "Fookuhila"))
        return defaultUser
    }
    
    static func testData() -> [UserData] {
        let testData = [UserData(firstName: "Williams", lastName: "Wayne", gender: "Male", age: "42",
                                 birthData: BirthData(birthday: "01.01.1980", town: "Battown", postcode: "10001", country: "Wayneester", state: "Waynetower"),
                                 adress: Adress(street: "Will Manor Street", numberOfStreet: "42", town: "Manor City", postcode: "67890", country: "To", state: "Everything")),
                        UserData(firstName: "Jennifer", lastName: "Williams", gender: "Female", age: "83",
                                 birthData: BirthData(birthday: "07.03.1940", town: "Anywhere", postcode: "10001", country: "Anycountry", state: "Anystate"),
                                 adress: Adress(street: "Foostreet", numberOfStreet: "1", town: "Anywhere", postcode: "10001", country: "Anycountry", state: "Anystate")),
                        UserData(firstName: "Max", lastName: "Mustermann", gender: "Other", age: "23",
                                 birthData: BirthData(birthday: "01.01.2000", town: "Maxstadt", postcode: "12345", country: "Germany", state: "Bavaria"),
                                 adress: Adress(street: "Musterstraße", numberOfStreet: "1", town: "Maxstadt", postcode: "12345", country: "Germany", state: "Bavaria"))]
        
        return testData
    }
}
