//
//  ContentView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 25/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CalendarScreen()
                .badge(10)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            NotesScreen()
                .tabItem {
                    Label("Notes", systemImage: "books.vertical.fill")
                }
            ProfileScreen()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .tint(.appPurple)
    }
}

#Preview("ContentView") {
    ContentView()
}





