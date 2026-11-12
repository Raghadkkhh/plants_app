//
//  PlantsData.swift
//  Plants
//
//  Created by Raghad Alsnaie on 10/11/2026.
//

import SwiftData
import Foundation

@Model
final class PlantsData {
    @Attribute(.unique) var id: UUID
    var plantName: String
    var plantRoom: Room
    var plantLight: LightLevel
    var plantWateringDays: WateringFrequency
    var plantWaterAmount: WaterAmount
    var plantIsWatered: Bool

    init(
        id: UUID = UUID(),
        plantName: String,
        plantRoom: Room,
        plantLight: LightLevel,
        plantWateringDays: WateringFrequency,
        plantWaterAmount: WaterAmount,
        plantIsWatered: Bool = false
    ) {
        self.id = id
        self.plantName = plantName
        self.plantRoom = plantRoom
        self.plantLight = plantLight
        self.plantWateringDays = plantWateringDays
        self.plantWaterAmount = plantWaterAmount
        self.plantIsWatered = plantIsWatered
    }
}

