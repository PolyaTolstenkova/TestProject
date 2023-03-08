//
//  ProfileManager.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

class ProfileManager: ProfileManagerProtocol {
    
    private let listManager = DataManager<DataResults>()
    private let profileManager = DataManager<ProfileResults>()
    
    private let listUrl = "https://opn-interview-service.nn.r.appspot.com/list"
    
    func fetchList(completion: @escaping (String?, Error?) -> Void) {
        
        listManager.fetchData(url: listUrl) { data, error in
            if let data = data {
                for id in data.data {
                    completion(id, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchProfile(id: String, completion: @escaping (ProfileResults?, Error?) -> Void) {
        
        let url = "https://opn-interview-service.nn.r.appspot.com/get/\(id)"
        profileManager.fetchData(url: url) { profile, error in
            if let profile = profile {
                completion(profile, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
