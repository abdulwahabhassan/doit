//
//  TaskView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 06/03/2025.
//

import SwiftUI

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}


struct AddTaskScreen: View {
    
    @Bindable private var observableTaskItem: TaskItemObservable = TaskItemObservable.shared
    //    @State private var task: TaskItem = taskItems.first!
    @State private var taskGroup: TaskGroupItem = taskGroupItems.first!
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var selected: TaskGroupItem = taskGroupItems.first!
    @State private var description: String = ""
    
    let list = ["Hey", "Hello", "Hi"]
    let groups = taskGroupItems
    @State var isOn: Bool = false
    
    var body: some View {
        ZStack {
            MainBackgroundView()
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(.arrowLeft)
                    })
                    Spacer()
                    Text("Add Task")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "bell.badge.fill")
                        .symbolRenderingMode(.multicolor)
                }
                .padding(.horizontal)

                HStack {
                    Image(systemName: taskGroup.systemImage)
                        .dynamicTypeSize(.small)
                        .foregroundColor(.appPink)
                        .padding(8)
                        .background(.appLightPink, in: RoundedRectangle(cornerRadius: 10))
                    VStack(alignment: .leading) {
                        Text("Task Group")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Picker(
                            selection: $selected,
                            content: {
                                ForEach(taskGroupItems) { item in
                                    Text(item.title)
                                }
                            },
                            label: {}
                        )
                        .padding(-10)
                        .tint(.appPurple)
                        .dynamicTypeSize(.small)
                    }
                    Spacer()
                }
                .padding(16)
                .background(.white, in: RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Task Name")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        TextField(text: $observableTaskItem.title, axis: .vertical, label: {
                            Text("Give task a name...")
                                .font(.subheadline)
                        })
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .textInputAutocapitalization(.words)
                    }
                    Spacer()
                }
                .padding(16)
                .background(.white, in: RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        TextEditor(text: $observableTaskItem.description)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(16)
                .background(.white, in: RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                DatePickerView(title: "Start Date", startDate: $startDate)
                DatePickerView(title: "End Date", startDate: $endDate)
                
                Spacer()
                Button(
                    action: {
                        print("tapped")
                    },
                    label: {
                        Text("Add Project")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(.appPurple, in: RoundedRectangle(cornerRadius: 16))
                    }
                )
                .padding(16)
                
            }
        }
    }
}

#Preview("AddTaskScreen") {
    AddTaskScreen()
}


fileprivate struct DatePickerView: View {
    
    let title: String
    @Binding var startDate: Date
    
    var body: some View {
        HStack {
            Image(systemName: "calendar.badge.clock")
                .dynamicTypeSize(.xxxLarge)
                .foregroundColor(.appPurple)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                CustomDatePicker(date: $startDate)
                    .frame(height: 28)
                    .dynamicTypeSize(.xSmall)
            }
        }
        .padding(16)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
    
}

#Preview {
    DatePickerView(title: "Date", startDate: .constant(Date()))
}

fileprivate struct CustomDatePicker: UIViewRepresentable {
    @Binding var date: Date
    
    func makeUIView(context: Context) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.contentHorizontalAlignment = .leading
        picker.setValue(UIColor.red, forKeyPath: "textColor")
        picker.tintColor = .appPurple
        return picker
    }
    
    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        uiView.date = date
    }
}
