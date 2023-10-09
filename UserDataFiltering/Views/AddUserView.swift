//
//  AddUserView.swift
//  UserDataFiltering
//

import SwiftUI

struct AddUserView: View {
    @StateObject var viewModel = AddUserViewModel()
    @StateObject var userDataViewModel: UserDataViewModel

    var body: some View {
        NavigationStack {
            AddUserToolbar(navigationTitle: "Add user", viewModel: viewModel, userDataViewModel: userDataViewModel)
            
            List {
                Section {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                    TextField("Gender", text: $viewModel.gender)
                    TextField("Age", text: $viewModel.age)
                } header: {
                    CustomListHeader(text: "General")
                }
                
                
                Section {
                    TextField("Street", text: $viewModel.street)
                    TextField("Number", text: $viewModel.numberOfStreet)
                    TextField("Town", text: $viewModel.town)
                    TextField("Postcode", text: $viewModel.postcode)
                    TextField("State", text: $viewModel.state)
                    TextField("Country", text: $viewModel.country)
                } header: {
                    CustomListHeader(text: "Adress")
                }
                
                Section {
                    TextField("Birthday", text: $viewModel.birthDay)
                    TextField("Town", text: $viewModel.birthTown)
                    TextField("Postcode", text: $viewModel.birthPostcode)
                    TextField("State", text: $viewModel.birthState)
                    TextField("Country", text: $viewModel.birthCountry)
                } header: {
                    CustomListHeader(text: "Birth")
                }
            }
            .listStyle(.plain)
            .navigationBarBackButtonHidden()
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.hidden)
        .interactiveDismissDisabled()
    }
}

#Preview {
    AddUserView(userDataViewModel: UserDataViewModel())
}
