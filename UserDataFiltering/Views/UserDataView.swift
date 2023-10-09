//
//  ContentView.swift
//  UserDataFiltering
//

import SwiftUI
import AVFoundation

struct UserDataView: View {
    @StateObject var viewModel = UserDataViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                UserDataToolbar(navigationTitle: "User data", viewModel: viewModel)
                
                CustomSearchField(text: $viewModel.text, isRecording: $viewModel.isRecording)
                    .padding()
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.filteredUserData) { userData in
                            NavigationLink {
                                SelectedUserView(userData: userData)
                            } label: {
                                UserRow(userData: userData)
                            }
                            .accentColor(.gray)
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.deleteItem(offset: indexSet)
                        })
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarBackButtonHidden()

            Spacer()
        }
        .sheet(isPresented: $viewModel.isPresentingSheet, content: {
            AddUserView(userDataViewModel: viewModel)
        })
    }
}

#Preview {
    UserDataView()
}
