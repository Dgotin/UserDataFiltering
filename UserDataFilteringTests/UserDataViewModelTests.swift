//
//  UserDataViewModelTests.swift
//  UserDataFilteringTests
//

import XCTest
@testable import UserDataFiltering

final class UserDataViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        Dependencies.shared.enableMockedBackend(true)
    }

    // MARK: containsOnlyNumbers tests
    @MainActor func test_filterData_withOnlyNumber_returnsUserData() {
        // Given
        let viewModel = UserDataViewModel()
        viewModel.addTestData()
        
        // When
        viewModel.text = "12345"
        viewModel.filterData()
        
        // Then
        let emptyUserData = viewModel.filteredUserData.isEmpty
        XCTAssertFalse(emptyUserData)
    }

    @MainActor func test_filterData_withNumberAndLetter_returnsEmptyUserData() {
        // Given
        let viewModel = UserDataViewModel()
        viewModel.addTestData()
        
        // When
        viewModel.text = "1234ABC"
        viewModel.filterData()
        
        // Then
        let emptyUserData = viewModel.filteredUserData.isEmpty
        XCTAssertTrue(emptyUserData)
    }
    
    @MainActor func test_filterData_byName_returnsOneFilteredItem() {
        // Given
        let viewModel = UserDataViewModel()
        let testName = "Max"
        viewModel.addTestData() // contains "Max Mustermann"
        
        // When
        viewModel.text = testName
        viewModel.filterData()
        
        // Then
        let dataIsContaining = viewModel.filteredUserData.contains(where: { $0.firstName == testName })
        let containsSingleItem = viewModel.filteredUserData.count == 1
        XCTAssertTrue(dataIsContaining && containsSingleItem)
    }

    // MARK: addTestData tests
    @MainActor func test_addTestData_filteredDataCountEqualsThree() {
        // Given
        let viewModel = UserDataViewModel()
        
        // When
        viewModel.addTestData() // in final there has to be 3 items

        // Then
        XCTAssertEqual(viewModel.filteredUserData.count, 3)
    }
    
    // MARK: addItem tests
    @MainActor func test_addItem_itemSuccessfullyAppended() {
        // Given
        let viewModel = UserDataViewModel()
        let defaultData = UserData.defaultData()
        
        // When
        viewModel.addItem(defaultData)
        
        // Then
        XCTAssertEqual(viewModel.filteredUserData.first!, defaultData)
        XCTAssertEqual(viewModel.filteredUserData.count, 1)
    }
    
    // MARK: deleteItem tests
    @MainActor func test_deleteItem_itemSuccessfullyDeleted() {
        // Given
        let viewModel = UserDataViewModel()
        
        // When
        for _ in 0..<3 {
            viewModel.addItem(UserData.defaultData())
        }
        let indexSet = IndexSet(integersIn: 0..<1)
        viewModel.deleteItem(offset: indexSet)
        
        // Then
        XCTAssertEqual(viewModel.filteredUserData.count, 2)
    }
}
