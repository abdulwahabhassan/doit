//
//  Header.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        HStack {
            HStack {
                Image(.imageProfile)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello!")
                        .font(.caption)
                    Text("Hassan Abdulwahab")
                        .font(.headline)
                }
            }
            Spacer()
            Image(systemName: "bell.badge.fill")
                .symbolRenderingMode(.multicolor)
        }
    }
}

#Preview("HeaderView") {
    HeaderView().padding()
}
