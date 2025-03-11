//
//  TaskGroups.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

enum Columns: Int {
    case One = 1
    case Two = 2
}

struct TaskGroupsView: View {
    @State private var columns: Columns = Columns.One
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text("Task Groups")
                        .font(.headline)
                    
                    Text("3")
                        .font(.caption2)
                        .padding(8)
                        .foregroundStyle(.appPurple)
                        .background(in: Circle())
                        .backgroundStyle(.appPurple.opacity(0.1))
                }
                Spacer()
                Button {
                    switch columns {
                    case .One:
                        columns = .Two
                    case .Two:
                        columns = .One
                    }
                } label: {
                    let iconName = switch columns {
                    case .One:
                        "rectangle.grid.2x2"
                    case .Two:
                        "rectangle.grid.1x2"
                    }
                    Image(systemName: iconName)
                        .foregroundStyle(.appPurple)
                        .imageScale(.small)
                }
                
            }.padding(.horizontal)

            ScrollView(.vertical) {
                LazyVGrid(columns: Array(
                    repeating: GridItem(.adaptive(minimum: .infinity)),
                    count: columns.rawValue
                ), content: {
                    ForEach(taskGroupItems, id: \.self) { item in
                        TaskGroupView(
                            foregroundColor: item.foregroundColor,
                            backgroundColor: item.backgroundColor,
                            systemImage: item.systemImage,
                            title: item.title,
                            taskCount: item.taskCount
                        )
                        .scaledToFit()
                        .scrollTransition(axis: .vertical) { effect, phase in
                            effect.opacity(phase.isIdentity ? 1 : 0)
                        }
                    }
                })
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.top, 8)
    }
}

#Preview("TaskGroupsView") {
    TaskGroupsView()
}

struct TaskGroupView: View {
    var progress: CGFloat = 0.7
    let foregroundColor: Color
    let backgroundColor: Color
    let systemImage: String
    let title: String
    let taskCount: Int
    
    var body: some View {
        HStack() {
            Image(systemName: systemImage)
                .dynamicTypeSize(.small)
                .foregroundColor(foregroundColor)
                .padding(8)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text("\(taskCount) Tasks")
                    .font(.caption)
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
                    .font(.caption2)
                    .bold()
                
            }
            .frame(width: 40, height: 40)
            
        }
        .padding(16)
        .background(in: RoundedRectangle(cornerRadius: 16))
        .backgroundStyle(.white)
        
        
    }
}

#Preview("TaskGroupView") {
    TaskGroupView(foregroundColor: .appPink, backgroundColor: .appLightPink, systemImage: "handbag.fill", title: "Office Projects",
              taskCount: 23)
}

