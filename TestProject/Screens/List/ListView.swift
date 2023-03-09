//
//  ContentView.swift
//  TestProject
//
//  Created by Полина Толстенкова on 07.03.2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.errorOccured {
                Text("No data found")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .bold()
            } else {
                List {
                    ForEach(viewModel.list, id: \.self) { profile in
                        NavigationLink {
                            ProfileView(viewModel: ProfileViewModel(id: profile.id, list: viewModel.list))
                        } label: {
                            Text(profile.firstName)
                        }

                    }
                }
            }
        }
        .alert(isPresented: $viewModel.alertIsPresented) {
            Alert(
                title: Text(viewModel.error?.localizedDescription ?? "unexpected_error".localized),
                dismissButton: .default(Text("alert_button_try_again".localized)) {
                    viewModel.retry()
                }
            )
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
