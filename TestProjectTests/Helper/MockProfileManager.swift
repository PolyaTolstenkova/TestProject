//
//  MockProfileManager.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import XCTest
@testable import TestProject

class MockProfileManager: ProfileManagerProtocol {
    
    var string: String?
    var error: FailureError?
    var profile: ProfileResults?
    
    func fetchList(completion: @escaping (String?, Error?) -> Void) {
        completion(string, error)
    }
    
    func fetchProfile(id: String, completion: @escaping (ProfileResults?, Error?) -> Void) {
        completion(profile, error)
    }
}
