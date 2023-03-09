//
//  DataManager.swift
//  TestProject
//
//  Created by Полина Толстенкова on 07.03.2023.
//

import Foundation
import Alamofire

class NetworkingManager: NetworkingManagerProtocol {

    private let jftManager: JWTManagerProtocol  = JWTManager()

    func fetchData<T: Decodable>(
        url: String,
        completion: @escaping (T?, Error?) -> Void
    ) {
        let headers = formHeaders()
        
        AF.request(url, headers: headers)
        .validate(statusCode: 200 ..< 300)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    private func formHeaders() -> HTTPHeaders {
        return [.authorization(bearerToken: jftManager.generateJWTToken())]
    }
}
