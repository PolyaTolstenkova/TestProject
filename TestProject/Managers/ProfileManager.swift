//
//  ProfileManager.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

class ProfileManager: ProfileManagerProtocol {
    
    private let networkingManager: NetworkingManagerProtocol
    private let listUrl = "https://opn-interview-service.nn.r.appspot.com/list"
    
    init(networkingManager: NetworkingManagerProtocol = NetworkingManager()) {
        self.networkingManager = networkingManager
    }
    
    func fetchList(completion: @escaping ([String]?, Error?) -> Void) {
        
        networkingManager.fetchData(url: listUrl) { (data: DataResults?, error) in
            if let data = data {
                completion(data.data, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchProfile(id: String, completion: @escaping (ProfileResults?, Error?) -> Void) {
        
        let url = "https://opn-interview-service.nn.r.appspot.com/get/\(id)"
        networkingManager.fetchData(url: url) { (profile: ProfileResults?, error) in
            if let profile = profile {
                completion(profile, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
