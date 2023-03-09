//
//  NetworkingManagerProtocol.swift
//  TestProject
//
//  Created by Полина Толстенкова on 09.03.2023.
//

import Foundation

protocol NetworkingManagerProtocol {
    
    func fetchData<T: Decodable>(
        url: String,
        completion: @escaping (T?, Error?) -> Void
    )
}
