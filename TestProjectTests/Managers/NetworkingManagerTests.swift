//
//  TestProjectTests.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import XCTest
@testable import TestProject

class NetworkingManagerTests: XCTestCase {
    
    func testFetchData() {
        
        let sut = NetworkingManager()
        let expectation = self.expectation(description: "fetchData() should return data and no error")
        
        let url = "https://opn-interview-service.nn.r.appspot.com/list"
        sut.fetchData(url: url) { (data: DataResults?, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchDataWithInvalidURL() {
        
        let sut = NetworkingManager()
        let expectation = self.expectation(description: "fetchData() should return error for invalid URL")
        
        let url = "invalidURL"
        sut.fetchData(url: url) { (data: DataResults?, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
