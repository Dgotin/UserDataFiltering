//
//  AddUserVIewModelTests.swift
//  UserDataFilteringTests
//

import XCTest
@testable import UserDataFiltering

final class AddUserVIewModelTests: XCTestCase {

    @MainActor func test_allViewModelProperties_areNotEmptyAfterInput() {
        // Given
        let viewModel = AddUserViewModel()
        
        // When
        viewModel.firstName = "testData"
        viewModel.lastName = "testData"
        viewModel.gender = "testData"
        viewModel.age = "testData"
        viewModel.street = "testData"
        viewModel.numberOfStreet = "testData"
        viewModel.town = "testData"
        viewModel.postcode = "testData"
        viewModel.country = "testData"
        viewModel.state = "testData"
        viewModel.birthDay = "testData"
        viewModel.birthTown = "testData"
        viewModel.birthPostcode = "testData"
        viewModel.birthState = "testData"
        viewModel.birthCountry = "testData"
        
        // Then
        let one = viewModel.firstName.isEmpty
        let two = viewModel.firstName.isEmpty
        let three = viewModel.lastName.isEmpty
        let four = viewModel.gender.isEmpty
        let five = viewModel.age.isEmpty
        let six = viewModel.street.isEmpty
        let seven = viewModel.numberOfStreet.isEmpty
        let eight = viewModel.town.isEmpty
        let nine = viewModel.postcode.isEmpty
        let ten = viewModel.country.isEmpty
        let eleven = viewModel.state.isEmpty
        let twelve = viewModel.birthDay.isEmpty
        let thirteen = viewModel.birthTown.isEmpty
        let fourteen = viewModel.birthPostcode.isEmpty
        let fifteen = viewModel.birthState.isEmpty
        let sixteen = viewModel.birthCountry.isEmpty
        XCTAssertFalse(one && two && three && four && five && six && seven && eight && nine && ten && eleven && twelve && thirteen && fourteen && fifteen && sixteen)
    }
    
    // MARK: resetData tests
    @MainActor func test_resetData_dataAreDeleted() {
        // Given
        let viewModel = AddUserViewModel()
        viewModel.firstName = "testData"
        viewModel.lastName = "testData"
        viewModel.gender = "testData"
        viewModel.age = "testData"
        viewModel.street = "testData"
        viewModel.numberOfStreet = "testData"
        viewModel.town = "testData"
        viewModel.postcode = "testData"
        viewModel.country = "testData"
        viewModel.state = "testData"
        viewModel.birthDay = "testData"
        viewModel.birthTown = "testData"
        viewModel.birthPostcode = "testData"
        viewModel.birthState = "testData"
        viewModel.birthCountry = "testData"

        // When
        viewModel.reset()

        // Then
        let one = viewModel.firstName.isEmpty
        let two = viewModel.firstName.isEmpty
        let three = viewModel.lastName.isEmpty
        let four = viewModel.gender.isEmpty
        let five = viewModel.age.isEmpty
        let six = viewModel.street.isEmpty
        let seven = viewModel.numberOfStreet.isEmpty
        let eight = viewModel.town.isEmpty
        let nine = viewModel.postcode.isEmpty
        let ten = viewModel.country.isEmpty
        let eleven = viewModel.state.isEmpty
        let twelve = viewModel.birthDay.isEmpty
        let thirteen = viewModel.birthTown.isEmpty
        let fourteen = viewModel.birthPostcode.isEmpty
        let fifteen = viewModel.birthState.isEmpty
        let sixteen = viewModel.birthCountry.isEmpty
        XCTAssertTrue(one && two && three && four && five && six && seven && eight && nine && ten && eleven && twelve && thirteen && fourteen && fifteen && sixteen)
    }
    
    // MARK: createUserData tests
    @MainActor func test_prepareAndSave_returnsUserData() {
        // Given
        let viewModel = AddUserViewModel()

        // When
        let savedData = viewModel.createUserData()
        
        // Then
        let isOfTypeUserData = savedData is UserData
        XCTAssertTrue(isOfTypeUserData)
    }

    @MainActor func test_prepareAndSave_propertiesAreFilled_returnsSameUserData() {
        // Given
        let viewModel = AddUserViewModel()
        let firstName = UUID().uuidString
        let lastName = UUID().uuidString
        let age = UUID().uuidString
        viewModel.firstName = firstName
        viewModel.lastName = lastName
        viewModel.age = age

        // When
        let savedData = viewModel.createUserData()
        
        // Then
        XCTAssertEqual(savedData.firstName, firstName)
        XCTAssertEqual(savedData.lastName, lastName)
        XCTAssertEqual(savedData.age, age)
    }

}
