//
//  ProfileViewModel.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: Profile = Profile()
    
    init(id: String, list: [Profile]) {
        self.profile = getProfileById(id: id, list: list)
    }
    
    func getProfileById(id: String, list: [Profile]) -> Profile {
        for profile in list where profile.id == id {
            return profile
        }
        return Profile()
    }
}
