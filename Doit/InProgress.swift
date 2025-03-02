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
                    .font(.subheadline)
                    .bold()
                
                Text("6")
                    .font(.caption2)
                    .padding(8)
                    .foregroundStyle(.appPurple)
                    .background(in: Circle())
                    .backgroundStyle(.appPurple.opacity(0.1))
                
                Spacer()
            }
            .padding(.horizontal)
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16, content: {
                    ForEach(inProgressCardItems, id: \.self) { item in
                        InProgressCard(category: item.category, text: item.text, systemImage: item.systemImage, backgroundColor: item.backgroundColor, progressColor: item.progressColor, iconBgColor: item.iconBgColor, iconColor: item.iconColor)
                    }
                }).padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .frame(height: 110)
            
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
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                
                Spacer()
                Image(systemName: systemImage)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(iconColor)
                    .padding(6)
                    .background(iconBgColor, in: RoundedRectangle(cornerRadius: 10))
                
            }
            HStack {
                Text(text)
                    .font(.caption)
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
        .frame(maxWidth: 250)
    }
}

#Preview("InProgressCard") {
    InProgressCard(category: "Office Project", text: "Grocery shopping app design", systemImage: "handbag.fill", backgroundColor: .appLightBlue, progressColor: .appBlue, iconBgColor: .appLightPink, iconColor: .appPink)
}
