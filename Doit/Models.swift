//
//  Models.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct InProgressCardItem: Hashable {
    let category: String
    let text: String
    let systemImage: String
    let backgroundColor: Color
    let progressColor: Color
    let iconBgColor: Color
    let iconColor: Color
    
}

let inProgressCardItems: [InProgressCardItem] = [
    InProgressCardItem(
        category: "Office Project",
        text: "Grocery shopping app design",
        systemImage: "handbag.fill",
        backgroundColor: .appLightBlue,
        progressColor: .appBlue,
        iconBgColor: .appLightPink,
        iconColor: .appPink
    ),
    InProgressCardItem(
        category: "Personal Project",
        text: "Uber eats redesign challenge",
        systemImage: "cup.and.saucer.fill",
        backgroundColor: .appLightOrange,
        progressColor: .appOrange,
        iconBgColor: .appLightBlue,
        iconColor: .appBlue
    )
]



struct TaskGroupItem: Hashable, Identifiable {
    var id: Self { self }
    let foregroundColor: Color
    let backgroundColor: Color
    let systemImage: String
    let title: String
    let taskCount: Int
}

var taskGroupItems: [TaskGroupItem] = [
    TaskGroupItem(
        foregroundColor: .appPink,
        backgroundColor: .appLightPink,
        systemImage: "handbag.fill",
        title: "Office Projects",
        taskCount: 23
    ),
    TaskGroupItem(
        foregroundColor: .appPurple,
        backgroundColor: .appLightPurple,
        systemImage: "person.crop.rectangle.stack.fill",
        title: "Other Projects",
        taskCount: 4
    ),
    TaskGroupItem(
        foregroundColor: .appOrange,
        backgroundColor: .appLightOrange,
        systemImage: "book.pages.fill",
        title: "Personal Projects",
        taskCount: 10
    )
    
]

struct TaskItem: Hashable {
    var id: Self { self }
    let title: String
    let description: String
    let startDate: Date
    let endDate: Date
}

@Observable 
class TaskItemObservable: Identifiable {
    var id: Self { self }
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date
    
    init(title: String, description: String, startDate: Date, endDate: Date) {
        self.title = title
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
    }
    
    static let shared: TaskItemObservable = TaskItemObservable(
        title: "Grocery Shopping App ",
        description: "This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.",
        startDate: Date(),
        endDate: Date())
}


let taskItems: [TaskItem] = [
    TaskItem(
        title: "Grocery Shopping App",
        description: "This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping. This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping. This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.",
        startDate: Date(),
        endDate: Date()
    )
]
