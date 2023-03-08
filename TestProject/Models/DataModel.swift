//
//  ProfileModel.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

struct DataResults: Codable {
    
    let data: [String]
    let status: String
}

struct ProfileResults: Codable {
    
    let status: String
    let data: ProfileData
    
    init(status: String = "", data: ProfileData = ProfileData()) {
        self.status = status
        self.data = data
    }
}

struct ProfileData: Codable, Identifiable {
    
    let id: String
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let country: String
    
    init(
        id: String = "",
        firstName: String = "",
        lastName: String = "",
        age: Int = 0,
        gender: String = "",
        country: String = ""
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
        self.country = country
    }
}
