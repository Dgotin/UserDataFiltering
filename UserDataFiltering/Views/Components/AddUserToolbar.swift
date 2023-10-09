//
//  AddUserToolbar.swift
//  UserDataFiltering
//

import SwiftUI

struct AddUserToolbar: View {
    let navigationTitle: String

    @StateObject
    var viewModel: AddUserViewModel
    
    @StateObject
    var userDataViewModel: UserDataViewModel

    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                userDataViewModel.isPresentingSheet = false
            }, label: {
                Text("Dismiss")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
            })
            .frame(width: 75)
            
            Spacer()
            
            Text(navigationTitle)
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            Spacer()

            Button(action: {
                let createdUserData = viewModel.createUserData()
                userDataViewModel.addItem(createdUserData)
            }, label: {
                Spacer()
                Text("Save")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
            })
            .frame(width: 75)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.blue)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    AddUserToolbar(navigationTitle: "Add user", viewModel: AddUserViewModel(), userDataViewModel: UserDataViewModel())
}
