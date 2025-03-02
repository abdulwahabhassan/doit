//
//  Card.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 02/03/2025.
//

import SwiftUI

struct Card: View {
    var progress: CGFloat = 0.7
    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 24) {
                Text("Your today's task almost done!")
                    .font(.caption2)
                    .foregroundStyle(.white)
                
                Button(action: {}, label: {
                    Text("View Task")
                        .font(.caption2)
                        .foregroundStyle(.appPurple)
                        .bold()
                })
                .buttonStyle(.bordered)
                .background(.white)
            }.padding()
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Image(systemName: "ellipsis.rectangle.fill")
                    .foregroundColor(.white)
                    .symbolRenderingMode(.hierarchical)
                
                HStack {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .opacity(0.3)
                            .foregroundColor(.white)
                        
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 0.5), value: progress)
                        
                        Text("70%")
                            .foregroundStyle(.white)
                            .font(.callout)
                            .bold()
                        
                    }
                    .frame(width: 85, height: 85)
                    Spacer()
                }
            }.padding()
        }
        .padding(.vertical, 10)
        .background(in: RoundedRectangle(cornerRadius: 25.0))
        .backgroundStyle(.appPurple)
        .padding(.vertical, 10)
    }
}

#Preview("Card") {
    Card().padding()
}
