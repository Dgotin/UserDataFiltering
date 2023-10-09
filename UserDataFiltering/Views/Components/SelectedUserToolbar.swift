//
//  SelectedUserToolbar.swift
//  UserDataFiltering
//

import SwiftUI

struct SelectedUserToolbar: View {
    @Environment(\.dismiss)
    var dismiss
    let text: String

    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
            })
            
            Spacer()
            
            Text(text)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.blue)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    SelectedUserToolbar(text: "Some person")
}
