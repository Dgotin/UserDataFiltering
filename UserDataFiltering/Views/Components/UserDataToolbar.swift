//
//  UserDataToolbar.swift
//  UserDataFiltering
//

import SwiftUI

struct UserDataToolbar: View {
    let navigationTitle: String

    @StateObject
    var viewModel: UserDataViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                viewModel.addTestData()
            }, label: {
                Text("Test")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer()
            })
            .frame(width: 75)
            
            Spacer()
            
            Text(navigationTitle)
                .fontWeight(.bold)
                .font(.system(size: 20))
                
            Spacer()

            Button(action: {
                viewModel.isPresentingSheet.toggle()
            }, label: {
                Spacer()
                Image(systemName: "plus")
                    .font(.system(size: 23))
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
    @StateObject var viewModel = UserDataViewModel()
    return UserDataToolbar(navigationTitle: "User data", viewModel: viewModel)
        .environmentObject(viewModel)
}
