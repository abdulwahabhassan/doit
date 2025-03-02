//
//  HomeView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Group {
                    Header()
                    Card()
                }.padding(.horizontal)
                
                InProgressSection()
                TaskGroups()
                Spacer()
            }
        }
    }
}

#Preview("HomeView") {
    HomeView()
}
