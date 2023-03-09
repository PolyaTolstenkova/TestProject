//
//  ListViewModel.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var list: [Profile] = []
    @Published var isLoading: Bool = true
    @Published var error: Error?
    @Published var errorOccured: Bool = false
    @Published var alertIsPresented: Bool = false
    
    private let profileManager: ProfileManagerProtocol
    
    init(profileManager: ProfileManagerProtocol = ProfileManager()) {
        self.profileManager = profileManager
        self.fetchList()
    }
    
    func fetchList() {
        profileManager.fetchList { [weak self] idList, error in
            if let error = error {
                self?.error = error
                self?.alertIsPresented = true
                self?.isLoading = false
            } else {
                self?.errorOccured = false
                if let idList = idList {
                    for id in idList {
                        self?.fetchProfile(id: id)
                    }
                }
            }
        }
    }
    
    func fetchProfile(id: String?) {
        if let id = id {
            profileManager.fetchProfile(id: id) { [weak self] profile, error in
                
                if !(self?.list.isEmpty ?? false) {
                    self?.isLoading = false
                }
                
                if let error = error {
                    self?.error = error
                    self?.alertIsPresented = true
                    self?.isLoading = false
                } else if let profile = profile {
                    self?.errorOccured = false
                    self?.list.append(
                        Profile(
                            id: profile.data.id,
                            firstName: profile.data.firstName,
                            lastName: profile.data.lastName,
                            age: profile.data.age,
                            gender: profile.data.gender,
                            country: profile.data.country
                        )
                    )
                }
            }
        }
    }
    
    func retry() {
        list = []
        error = nil
        alertIsPresented = true
        isLoading = true
        errorOccured = true
        
        fetchList()
    }
}
