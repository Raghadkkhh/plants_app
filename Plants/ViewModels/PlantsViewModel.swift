//
//  PlantsViewModel.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI
import SwiftData

enum PlantsScreenState {
    case empty
    case list
    case allDone
}

@Observable
final class PlantsViewModel {
    var showingAddSheet = false
    var plantToEdit: PlantsData?

    func state(for plants: [PlantsData]) -> PlantsScreenState {
        if plants.isEmpty { return .empty }
        if plants.allSatisfy({ $0.plantIsWatered }) { return .allDone }
        return .list
    }

    func sorted(_ plants: [PlantsData]) -> [PlantsData] {
        plants.filter { !$0.plantIsWatered } + plants.filter { $0.plantIsWatered }
    }

    func wateredCount(in plants: [PlantsData]) -> Int {
        plants.filter { $0.plantIsWatered }.count
    }

    func progress(for plants: [PlantsData]) -> Double {
        guard !plants.isEmpty else { return 0 }
        return Double(wateredCount(in: plants)) / Double(plants.count)
    }

    func headerMessage(for plants: [PlantsData]) -> String {
        let count = wateredCount(in: plants)
        if count == 0 { return "Your plants are waiting for a sip 💦" }
        return "\(count) of your plants feel loved today ✨"
    }

    func toggleWatered(_ plant: PlantsData) {
        plant.plantIsWatered.toggle()
    }

    func delete(_ plant: PlantsData, in context: ModelContext) {
        NotificationManager.shared.cancel(for: plant)
        context.delete(plant)
    }
}
