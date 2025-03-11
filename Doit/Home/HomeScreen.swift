//
//  HomeView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            MainBackgroundView()
            VStack {
                Group {
                    HeaderView()
                    DashboardCardView()
                }.padding(.horizontal)
                
                InProgressSectionView()
                TaskGroupsView()
            }
        }
    }
}

#Preview("HomeScreen") {
    HomeScreen()
}
