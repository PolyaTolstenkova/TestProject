//
//  ProfileViewModelTests.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import XCTest
@testable import TestProject

class ProfileViewModelTests: XCTestCase {
    
    func testGetProfileById() {
        let profile = Profile(id: "1")
        let sut = ProfileViewModel(id: "1", list: [profile])
        
        XCTAssertEqual(sut.profile, profile)
    }
}
