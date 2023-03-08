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
        let sut = ProfileManager()
        let expectation = self.expectation(description: "fetchList() should return a non-empty list")
        
        sut.fetchList { (id, error) in
            XCTAssertNotNil(id)
            XCTAssertNil(error)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchProfile() {
        let sut = ProfileManager()
        let expectation = self.expectation(description: "fetchProfile() should return a profile object")
        
        sut.fetchProfile(id: "1") { (profile, error) in
            XCTAssertNotNil(profile)
            XCTAssertNil(error)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchProfileWithInvalidID() {
        let sut = ProfileManager()
        let expectation = self.expectation(description: "fetchProfile() should return an error for an invalid ID")
        
        sut.fetchProfile(id: "") { (profile, error) in
            XCTAssertNil(profile)
            XCTAssertNotNil(error)
        }
        
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
}
