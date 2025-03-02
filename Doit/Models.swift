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

let inProgressCardItems = [
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

struct TaskGroupItem: Hashable {
    let foregroundColor: Color
    let backgroundColor: Color
    let systemImage: String
}

let taskGroupItems = [
    TaskGroupItem(
        foregroundColor: .appPink,
        backgroundColor: .appLightPink,
        systemImage: "handbag.fill"
    ),
    TaskGroupItem(
        foregroundColor: .appPurple,
        backgroundColor: .appLightPurple,
        systemImage: "person.crop.rectangle.stack.fill"
    ),
    TaskGroupItem(
        foregroundColor: .appOrange,
        backgroundColor: .appLightOrange,
        systemImage: "book.pages.fill"
    )
    
]
