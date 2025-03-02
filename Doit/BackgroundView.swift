//
//  BackgroundView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 03/03/2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.white
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.appOrange)
                .frame(width: 100, height: 100)
                .offset(x: 100, y: 150)
                .opacity(0.6)
            
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.appBlue)
                .frame(width: 100, height: 100)
                .offset(x: 100, y: 400)
                .opacity(0.6)
            
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.appGreen)
                .frame(width: 100, height: 100)
                .offset(x: 100, y: -400)
                .opacity(0.6)
            
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.appPink)
                .frame(width: 100, height: 100)
                .offset(x: -150, y: -300)
                .opacity(0.6)
            
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.appPurple)
                .frame(width: 100, height: 100)
                .offset(x: -70, y: -50)
                .opacity(0.6)
            
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .offset(x: -120, y: 300)
                .opacity(0.6)
            
            Circle()
                .stroke(lineWidth: 16)
                .foregroundColor(.appYellow)
                .frame(width: 100, height: 100)
                .offset(x: 150, y: -160)
                .opacity(0.6)
            
            
            Color.clear
                .ignoresSafeArea()
                .background(.thinMaterial)
            
        }
        
    }
}

#Preview("BackgroundView") {
    BackgroundView()
}
