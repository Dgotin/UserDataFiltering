//
//  CustomListHeader.swift
//  UserDataFiltering
//

import SwiftUI

struct CustomListHeader: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title2)
            .foregroundStyle(.black)
    }
}

#Preview {
    CustomListHeader(text: "Text")
}
