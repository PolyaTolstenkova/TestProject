//
//  ListViewModelTests.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import XCTest
@testable import TestProject

class ListViewModelTests: XCTestCase {
    
    func testFetchProfile() {
        let mockProfileManager = MockProfileManager()
        let sut = ListViewModel(profileManager: mockProfileManager)
        
        mockProfileManager.profile = ProfileResults()
        
        sut.fetchProfile(id: "1")
        
        XCTAssertNil(sut.error)
        XCTAssertFalse(sut.list.isEmpty)
    }
    
    func testFetchProfileFailure() {
        let mockProfileManager = MockProfileManager()
        let sut = ListViewModel(profileManager: mockProfileManager)
        
        mockProfileManager.error = FailureError(message: "Failed to get a profile")
        
        sut.fetchProfile(id: "1")
        
        XCTAssertNotNil(sut.error)
        XCTAssertTrue(sut.list.isEmpty)
    }
    
    func testFetchList() {
        let mockProfileManager = MockProfileManager()
        let sut = ListViewModel(profileManager: mockProfileManager)
        
        mockProfileManager.profile = ProfileResults()
        
        sut.fetchList()
        
        XCTAssertNil(sut.error)
    }
    
    func testFetchListFailure() {
        let mockProfileManager = MockProfileManager()
        let sut = ListViewModel(profileManager: mockProfileManager)
        
        mockProfileManager.error = FailureError(message: "Failed to get a profile")
        
        sut.fetchList()
        
        XCTAssertNotNil(sut.error)
        XCTAssertTrue(sut.list.isEmpty)
    }
}
