//
//  ProfileDetails.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            HStack {
                profileBoldtext(text: viewModel.profile.firstName, size: 25)
                profileBoldtext(text: viewModel.profile.lastName, size: 25)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            profileText(text: "\("profile_age".localized) \(viewModel.profile.age)", size: 20)
            profileText(text: "\("profile_gender".localized) \(viewModel.profile.gender)", size: 20)
            profileText(text: "\("profile_country".localized) \(viewModel.profile.country)", size: 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        Spacer()
    }
}

extension ProfileView {
    
    func profileText(text: String, size: CGFloat, bold: Bool = false) -> some View {
        Text(text)
            .font(.system(size: size))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 1)
    }
    
    func profileBoldtext(text: String, size: CGFloat) -> some View {
        Text(text)
            .font(.system(size: size))
            .bold()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(id: "", list: []))
    }
}
