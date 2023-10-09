//
//  SelectedUserView.swift
//  UserDataFiltering
//

import SwiftUI

struct SelectedUserView: View {
    let userData: UserData
    var body: some View {
        NavigationStack {
            SelectedUserToolbar(text: "\(userData.firstName)'s infos")

            VStack(alignment: .leading, spacing: 25) {
                
                HStack {
                    Image(systemName: "person")
                        .customImageStyle()
                    
                    VStack(alignment: .leading) {
                        Text("First name: \(userData.firstName)")
                        Text("Last name: \(userData.lastName)")
                        Text("Age: \(userData.age)")
                    }
                    
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "map.circle")
                        .customImageStyle()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Street: \(userData.adress.street)")
                            Text("\(userData.adress.numberOfStreet ?? "")")
                        }

                        HStack {
                            Text("Town: \(userData.adress.postcode)")
                            Text("\(userData.adress.town)")
                        }

                        HStack {
                            Text("Country: \(userData.adress.state),")
                            Text("\(userData.adress.country)")
                        }
                    }
                }

                HStack {
                    Image(systemName: "figure.2.and.child.holdinghands")
                        .customImageStyle()
                    
                    VStack(alignment: .leading) {
                        Text("Born in \(userData.birthData.town), \(userData.birthData.state)")
                        Text("Birthday: \(userData.birthData.birthday)")
                    }
                }
            }
            .padding()
            .navigationBarBackButtonHidden()
            
            Spacer()
        }
    }
}

#Preview {
    SelectedUserView(userData: UserData.defaultData())
}

extension Image {
    func customImageStyle() -> some View {
        self
            .resizable()
            .frame(width: 60, height: 60)
    }
}
