//
//  MockNetworkingManager.swift
//  TestProjectTests
//
//  Created by Полина Толстенкова on 09.03.2023.
//

import XCTest
@testable import TestProject

class MockNetworkingManager: NetworkingManagerProtocol {
    
    var data: Data?
    var error: FailureError?
    
    func fetchData<T: Decodable>(url: String, completion: @escaping (T?, Error?) -> Void) {
        if let data = data {
           do {
               let decodedData = try JSONDecoder().decode(T.self, from: data)
               completion(decodedData, nil)
           } catch {
               completion(nil, error)
           }
       } else if let error = error {
           completion(nil, error)
       }
    }
}
