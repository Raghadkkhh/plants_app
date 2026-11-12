//
//  PlantsApp.swift
//  Plants
//
//  Created by Raghad Alsnaie on 09/11/2026.
//

import SwiftUI
import SwiftData

@main
struct plantsApp: App {
    init() {
        _ = NotificationManager.shared
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: PlantsData.self)
    }
}
