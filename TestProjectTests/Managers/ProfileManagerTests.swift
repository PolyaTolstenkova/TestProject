//
//  ProfileManagerTests.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import XCTest
@testable import TestProject

class ProfileManagerTests: XCTestCase {
    
    func testFetchList() {
        let mockNetworkingManager = MockNetworkingManager()
        let sut = ProfileManager(networkingManager: MockNetworkingManager())
        let expectation = self.expectation(description: "fetchList() should return a non-empty list")
        
        mockNetworkingManager.data = Data()
        
        sut.fetchList { (id, error) in
            XCTAssertNotNil(id)
            XCTAssertNil(error)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchListFailure() {
        let mockNetworkingManager = MockNetworkingManager()
        let sut = ProfileManager(networkingManager: MockNetworkingManager())
        let expectation = self.expectation(description: "fetchList() should return a non-empty list")
        
        mockNetworkingManager.error = FailureError(message: "Failed to get data")
        
        sut.fetchList { (id, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(id)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchProfile() {
        let mockNetworkingManager = MockNetworkingManager()
        let sut = ProfileManager(networkingManager: MockNetworkingManager())
        let expectation = self.expectation(description: "fetchProfile() should return a profile object")
        
        mockNetworkingManager.data = Data()
        
        sut.fetchProfile(id: "1") { (profile, error) in
            XCTAssertNotNil(profile)
            XCTAssertNil(error)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchProfileWithInvalidID() {
        let mockNetworkingManager = MockNetworkingManager()
        let sut = ProfileManager(networkingManager: MockNetworkingManager())
        let expectation = self.expectation(description: "fetchProfile() should return an error for an invalid ID")
        
        mockNetworkingManager.error = FailureError(message: "Invalid ID")
        
        sut.fetchProfile(id: "") { (profile, error) in
            XCTAssertNil(profile)
            XCTAssertNotNil(error)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
}
