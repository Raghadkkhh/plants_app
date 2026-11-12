//
//  OnboardingView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    @State private var showingAddSheet = false
    var onFinish: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("My Plants 🌱")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)

                    Divider().overlay(Color.cardBackground)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Image("Plant_pic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 70)

                Text("Start your plant journey!")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .padding(.top, 37)

                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .font(.footnote)
                    .foregroundStyle(Color.appGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top, 8)

                Button {
                    showingAddSheet = true
                } label: {
                    Text("Set Plant Reminder")
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.appGreen, in: Capsule())
                }
                .padding(.horizontal, 60)
                .padding(.top, 105)

                Spacer()
            }
        }
        .sheet(isPresented: $showingAddSheet, onDismiss: onFinish) {
            SetReminderView()
        }
    }
}

#Preview {
    OnboardingView(onFinish: {})
        .modelContainer(for: PlantsData.self, inMemory: true)
}
