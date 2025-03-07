//
//  TaskView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 06/03/2025.
//

import SwiftUI

struct TaskView: View {
    
//    @ObservedObject
    
    @State private var group: String = ""
    @State private var task: String = ""
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var selected: TextSelectability? = nil
    
    let bsn = Binding {
        ""
    } set: { value in
        
    }


    var body: some View {
        
    
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    
        TextField("Name", text: .constant(""), axis: .horizontal)
            .lineLimit(0...4)
            .containerRelativeFrame(.horizontal)
            .background(.red)
    }
}

#Preview {
    TaskView()
}
