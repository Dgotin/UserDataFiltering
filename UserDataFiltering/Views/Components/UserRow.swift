//
//  UserRow.swift
//  UserDataFiltering
//

import SwiftUI

struct UserRow: View {
    let userData: UserData
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundStyle(.gray)
                    .opacity(0.15)
                    .frame(width: 45, height: 45)

                Text(userData.firstName.prefix(1))
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
            }
            
            HStack {
                Text("\(userData.firstName) \(userData.lastName)")
            }
        }
    }
}

#Preview {
    UserRow(userData: UserData.defaultData())
}
