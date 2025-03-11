//
//  AppBar.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 10/03/2025.
//

import SwiftUI

struct AppBarView: View {
    let title: String
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(.arrowLeft)
            })
            Spacer()
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: "bell.badge.fill")
                .symbolRenderingMode(.multicolor)
        }
        .padding(.horizontal)
        .padding(.vertical, 13)
    }
}

#Preview("AppBarView") {
    AppBarView(title: "App Bar")
}
