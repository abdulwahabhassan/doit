//
//  WelcomView.swift
//  Doit
//
//  Created by Hassan Abdulwahab on 10/03/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            WelcomeBackgroundView()
            VStack {
                Spacer()
                ZStack {
                    Image(.femaleSitting)
                    Image(.stackedNotifications)
                        .offset(x: 65)
                    
                    Image(.blueDeskCalendar)
                        .offset(x: 80, y: -100)
                    Image(.blueStopWatch)
                        .offset(x: -80, y: -150)
                    Image(.pieChart)
                        .offset(x: -110, y: -50)
                    Image(.vaseTulipsGlasses)
                        .offset(x: -100, y: 60)
                    Image(.closeUpOfPinkCoffeeCup)
                        .offset(x: -120, y: 80)
                    Image(.pinkDot)
                        .offset(x: -70, y: 150)
                    Image(.yellowDot)
                        .offset(x: 50, y: 140)
                    Image(.lightBlueDot)
                        .offset(x: -40, y: 160)
                    Image(.lightBlueDotLarge)
                        .offset(x: 40, y: -170)
                    Image(.brightGreenDot)
                        .offset(x: 80, y: 120)
                    Image(.purpleDot)
                        .offset(x: -10, y: -150)
                }
                Spacer()
                Group {
                    Text("Task Management &\n To-Do List")
                        .font(.title2)
                        .bold()
                        
                    Text("This productive tool is designed to help you better manage your task project-wise conveniently!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)

                Button(action: {}, label: {
                    Text("Let's Start")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .bold()
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.appPurple, in: .rect(cornerRadius: 16))
                })
                .padding(.bottom, 40)
                .padding(.top, 16)
            
            }
            .padding(16)
        }
    }
}

#Preview("WelcomeView") {
    WelcomeView()
}
