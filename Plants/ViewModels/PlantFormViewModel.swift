//
//  PlantFormViewModel.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI
import SwiftData

@Observable
final class PlantFormViewModel {
    var plantName: String = ""
    var room: Room = .bedroom
    var light: LightLevel = .fullSun
    var wateringFrequency: WateringFrequency = .everyDay
    var waterAmount: WaterAmount = .small

    private(set) var plantToEdit: PlantsData?

    var isEditing: Bool { plantToEdit != nil }

    var isValid: Bool {
        !plantName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    init(plant: PlantsData? = nil) {
        guard let plant else { return }
        plantToEdit = plant
        plantName = plant.plantName
        room = plant.plantRoom
        light = plant.plantLight
        wateringFrequency = plant.plantWateringDays
        waterAmount = plant.plantWaterAmount
    }

    func save(in context: ModelContext) {
        let name = plantName.trimmingCharacters(in: .whitespacesAndNewlines)
        let savedPlant: PlantsData

        if let plant = plantToEdit {
            plant.plantName = name
            plant.plantRoom = room
            plant.plantLight = light
            plant.plantWateringDays = wateringFrequency
            plant.plantWaterAmount = waterAmount
            savedPlant = plant
        } else {
            let newPlant = PlantsData(
                plantName: name,
                plantRoom: room,
                plantLight: light,
                plantWateringDays: wateringFrequency,
                plantWaterAmount: waterAmount
            )
            context.insert(newPlant)
            savedPlant = newPlant
        }

        NotificationManager.shared.requestPermission()
        NotificationManager.shared.schedule(for: savedPlant)
    }

    func delete(in context: ModelContext) {
        if let plant = plantToEdit {
            NotificationManager.shared.cancel(for: plant)
            context.delete(plant)
        }
    }
}
