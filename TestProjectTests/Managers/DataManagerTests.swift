//
//  TestProjectTests.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import XCTest
@testable import TestProject

class DataManagerTests: XCTestCase {
    
    func testFetchData() {
        
        let sut = DataManager<DataResults>()
        let expectation = self.expectation(description: "fetchData() should return data and no error")
        
        let url = "https://opn-interview-service.nn.r.appspot.com/list"
        sut.fetchData(url: url) { (data, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchDataWithInvalidURL() {
        
        let sut = DataManager<DataResults>()
        let expectation = self.expectation(description: "fetchData() should return error for invalid URL")
        
        let url = "invalidURL"
        sut.fetchData(url: url) { (data, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
