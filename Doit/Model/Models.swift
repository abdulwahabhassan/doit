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
    let group: String
    let title: String
    let description: String
    let startDate: Date
    let endDate: Date
    let systemImage: String
    let iconColor: Color
    let iconBgColor: Color
    let status: TaskStatus
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
        group: "Personal Project",
        title: "Grocery Shopping App",
        description: "This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.",
        startDate: Date(),
        endDate: Date(),
        systemImage: "handbag.fill",
        iconColor: .appPink,
        iconBgColor: .appLightPink,
        status: .Completed
    ),
    TaskItem(
        group: "Office Project",
        title: "Office Task",
        description: "This is an office task planner",
        startDate: Date(),
        endDate: Date(),
        systemImage: "folder.fill",
        iconColor: .appPurple,
        iconBgColor: .appLightPurple,
        status: .Inprogress
    ),
    TaskItem(
        group: "Shopping",
        title: "Buy Avocado",
        description: "Stop the market on your way to work and buy some avocado",
        startDate: Date(),
        endDate: Date(),
        systemImage: "cart.fill",
        iconColor: .appOrange,
        iconBgColor: .appLightOrange,
        status: .Todo
    )
]


enum TaskStatus: String {
    case Todo = "Todo", Inprogress = "In Progress", Completed = "Done"
    static let values: [TaskStatus] = [TaskStatus.Completed, TaskStatus.Inprogress, TaskStatus.Todo]
}

enum TaskStatusFilter: String {
    case Todo = "Todo", Inprogress = "In Progress", Completed = "Completed", All = "All"
    static let values: [TaskStatusFilter] = [TaskStatusFilter.All, TaskStatusFilter.Todo,  TaskStatusFilter.Inprogress, TaskStatusFilter.Completed]
}
