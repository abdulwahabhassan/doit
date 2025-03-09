//
//  InProgress.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct InProgressSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("In Progress")
                    .font(.headline)
                
                Text("6")
                    .font(.caption)
                    .padding(8)
                    .foregroundStyle(.appPurple)
                    .background(in: Circle())
                    .backgroundStyle(.appPurple.opacity(0.1))
                
                Spacer()
            }
            .padding(.horizontal)
            ScrollViewReader(content: { proxy in
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .center, spacing: -8, content: {
                        ForEach(inProgressCardItems, id: \.self) { item in
                            InProgressCard(category: item.category, text: item.text, systemImage: item.systemImage, backgroundColor: item.backgroundColor, progressColor: item.progressColor, iconBgColor: item.iconBgColor, iconColor: item.iconColor)
                        }
                        Button {
                            if let firstItem = inProgressCardItems.first {
                                proxy.scrollTo(firstItem, anchor: .leading)
                            }
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.2")
                                .imageScale(.small)
                                .foregroundStyle(.appPurple)
                                .padding(.leading)
                        }
                    })
                    .padding(.trailing)
                }
                .scrollIndicators(.hidden)
                .frame(height: 110)
            })
        }
    }
}


#Preview("InProgressSection") {
    InProgressSection()
}

struct InProgressCard: View {
    let category: String
    let text: String
    let systemImage: String
    let backgroundColor: Color
    let progressColor: Color
    let iconBgColor: Color
    let iconColor: Color
    
    var body: some View {
        VStack {
            HStack {
                Text(category)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                Spacer()
                Image(systemName: systemImage)
                    .dynamicTypeSize(.small)
                    .foregroundColor(iconColor)
                    .padding(6)
                    .background(iconBgColor, in: RoundedRectangle(cornerRadius: 10))
                
            }
            HStack {
                Text(text)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                Spacer()
            }
            
            ProgressView(value: 70, total: 100)
                .tint(progressColor)
            
            
        }
        .padding([.leading, .trailing, .bottom], 20)
        .padding(.top, 16)
        .background(in: RoundedRectangle(cornerRadius: 16))
        .backgroundStyle(backgroundColor)
        .padding(.leading)
        .frame(maxWidth: 250)
    }
}

#Preview("InProgressCard") {
    InProgressCard(category: "Office Project", text: "Grocery shopping app design", systemImage: "handbag.fill", backgroundColor: .appLightBlue, progressColor: .appBlue, iconBgColor: .appLightPink, iconColor: .appPink)
}
