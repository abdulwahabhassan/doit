//
//  ContentView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 25/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CalendarView()
                .badge(10)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "books.vertical.fill")
                }
            ProfileView()
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





