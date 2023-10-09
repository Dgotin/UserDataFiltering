//
//  CustomSearchField.swift
//  UserDataFiltering
//

import SwiftUI

struct CustomSearchField: View {
    @Binding var text: String
    @Binding var isRecording: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("Any name or postcode", text: $text)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.black)

                Button(action: {
                    isRecording.toggle()
                }, label: {
                    if isRecording {
                        Image(systemName: "mic.fill")
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "mic")
                    }
                })
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
            )
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    @State var text = "Foobar"
    @State var isRecording = false
    return CustomSearchField(text: $text, isRecording: $isRecording).padding()
}
