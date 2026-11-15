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

    func summary(for plants: [PlantsData]) -> PlantsSummary {
        PlantsSummary(
            total: plants.count,
            watered: plants.filter { $0.plantIsWatered }.count
        )
    }

    func toggleWatered(_ plant: PlantsData) {
        plant.plantIsWatered.toggle()
    }

    func delete(_ plant: PlantsData, in context: ModelContext) {
        NotificationManager.shared.cancel(for: plant)
        context.delete(plant)
    }
}
