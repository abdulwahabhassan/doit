//
//  CalendarView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct CalendarScreen: View {
    var body: some View {
        ZStack {
            MainBackgroundView()
            VStack {
                AppBarView(title: "Today's Task")
                ScrollView([.horizontal]) {
                    LazyHStack(content: {
                        Spacer(minLength: 8)
                        ForEach(1...10, id: \.self) { count in
                            DayView(month: "Mar", day: "\(count)", weekday: "Tue", selected: count == 3)
                        }
                        Spacer(minLength: 8)
                    })
                    
                }
                .scrollIndicators(.hidden)
                .frame(height: 90)
                .padding(.vertical, 8)
                
                ScrollView(.horizontal) {
                    LazyHStack(content: {
                        Spacer(minLength: 16)
                        ForEach(TaskStatusFilter.values, id: \.self) { status in
                            TaskFilterView(title: status.rawValue, selected: status == TaskStatusFilter.All)
                        }
                    })
                }
                .scrollIndicators(.hidden)
                .frame(height: 50)
                .padding(.vertical, 8)
                
                LazyVStack(content: {
                    ForEach(taskItems, id: \.self) { task in
                        TaskView(
                            group: task.group,
                            title: task.title,
                            systemImage: task.systemImage,
                            description: task.description,
                            endDate: task.endDate,
                            status: task.status,
                            iconColor: (bg: task.iconBgColor, icon: task.iconColor)
                        )
                    }
                })
                Spacer()
            }
        }
    }
}


#Preview("CalendarScreen") {
    CalendarScreen()
}


struct DayView: View  {
    
    let month: String
    let day: String
    let weekday: String
    let selected: Bool
    
    var body: some View {
        
        Button(
            action: {},
            label: {
                VStack {
                    Text(month)
                        .font(.caption)
                    Text(day)
                        .font(.headline)
                        .padding(.vertical, 0.5)
                    Text(weekday)
                        .font(.caption)
                    
                }
                .foregroundStyle(selected ? .white : .black)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(selected ? .appPurple : .white, in: RoundedRectangle(cornerRadius: 16))
            })
        
    }
}

#Preview("DayView") {
    DayView(month: "May", day: "25", weekday: "Sun", selected: true)
}


struct TaskFilterView: View  {
    
    let title: String
    let selected: Bool
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(selected ? .appPurple : .appLightPurple, in: RoundedRectangle(cornerRadius: 8))
                .foregroundColor(selected ? .white : .appPurple)
        }
        
    }
}

#Preview("TaskFilterView") {
    TaskFilterView(title: "All", selected: true)
}

struct TaskView: View {
    let group: String
    let title: String
    let systemImage: String
    let description: String
    let endDate: Date
    let status: TaskStatus
    let iconColor: (bg: Color, icon: Color)
    
    var body: some View {
        VStack {
            HStack {
                Text(group)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                Spacer()
                Image(systemName: systemImage)
                    .font(.caption2)
                    .foregroundColor(iconColor.icon)
                    .padding(6)
                    .background(iconColor.bg, in: RoundedRectangle(cornerRadius: 10))
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                
                HStack {
                    Label {
                        Text(endDate.formatted(date: .omitted, time: .shortened))
                    } icon: {
                        Image(systemName: "clock.fill")
                    }
                    .font(.caption)
                    .foregroundStyle(.appLightPurpleVariant)
                    Spacer()
                    let color: (bg: Color, text: Color) = switch status {
                    case .Completed: (.appLightPurple, .appPurple)
                    case .Inprogress: (.appLightOrange, .appOrange)
                    case .Todo: (.appLightBlue, .appBlue)
                    }
                    Text(status.rawValue)
                        .font(.caption2)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(color.bg, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(color.text)
                }
            }
        }
        .padding(16)
        .background(in: RoundedRectangle(cornerRadius: 16))
        .backgroundStyle(.white)
        .padding(.horizontal)
    }
}

#Preview("TaskView") {
    TaskView(
        group: "Office Project",
        title: "Market Research",
        systemImage: "handbag.fill",
        description: "",
        endDate: Date(),
        status: .Inprogress,
        iconColor: (.appLightPink, .appPink)
    )
}
