//
//  TaskGroups.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct TaskGroups: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Task Groups")
                    .font(.subheadline)
                    .bold()
                
                Text("3")
                    .font(.caption2)
                    .padding(8)
                    .foregroundStyle(.appPurple)
                    .background(in: Circle())
                    .backgroundStyle(.appPurple.opacity(0.1))
                
                Spacer()
            }.padding(.horizontal)
            ScrollView(.vertical) {
                LazyVStack(alignment: .center, spacing: 8, content: {
                    ForEach(taskGroupItems, id: \.self) { item in
                        TaskGroup(foregroundColor: item.foregroundColor, backgroundColor: item.backgroundColor, systemImage: item.systemImage, title: item.title, taskCount: item.taskCount)
                    }
                })
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview("TaskGroups") {
    TaskGroups()
}

struct TaskGroup: View {
    var progress: CGFloat = 0.7
    let foregroundColor: Color
    let backgroundColor: Color
    let systemImage: String
    let title: String
    let taskCount: Int
    
    var body: some View {
        HStack() {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(foregroundColor)
                .padding(8)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption2)
                    .foregroundStyle(.black)
                
                
                Text("\(taskCount) Tasks")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }.padding(.leading, 8)
            
            Spacer()
            ZStack {
                Circle()
                    .stroke(lineWidth: 3)
                    .opacity(1)
                    .foregroundColor(backgroundColor)
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .foregroundColor(foregroundColor)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.5), value: progress)
                
                Text("70%")
                    .foregroundStyle(.black)
                    .font(Font.system(size: 12, weight: .regular))
                    .bold()
                
            }
            .frame(width: 40, height: 40)
            
        }
        .padding(.horizontal, 16)
        .padding( .vertical, 12)
        .background(in: RoundedRectangle(cornerRadius: 25.0))
        .backgroundStyle(.white)
        
        
    }
}

#Preview("TaskGroup") {
    TaskGroup(foregroundColor: .appPink, backgroundColor: .appLightPink, systemImage: "handbag.fill", title: "Office Projects",
              taskCount: 23)
}

