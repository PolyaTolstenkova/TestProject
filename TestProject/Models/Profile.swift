//
//  Profile.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

struct Profile: Hashable {
    
    var id: String
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var country: String
    
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
