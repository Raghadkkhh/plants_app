//
//  ContentView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 09/11/2026.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if hasSeenOnboarding {
            MyPlantsView()
        } else {
            OnboardingView {
                hasSeenOnboarding = true
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
        .modelContainer(for: PlantsData.self, inMemory: true)
}
