//
//  ProfileManagerProtocol.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

protocol ProfileManagerProtocol {
    
    func fetchList(completion: @escaping ([String]?, Error?) -> Void)
    func fetchProfile(id: String, completion: @escaping (ProfileResults?, Error?) -> Void)
}
