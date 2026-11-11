//
//  PlantsData.swift
//  Plants
//
//  Created by Raghad Alsnaie on 10/11/2026.
//

import SwiftData
import Foundation

@Model
class PlantsData{
    var id: UUID
    var plant_name: String
    var plant_room: String
    var plant_light: String
    var plant_wateringDays: String
    var plant_waterAmount: String
    var plant_isWatered: Bool
        
        init(id: UUID = UUID(), plant_name: String, plant_room: String, plant_light: String, plant_wateringDays: String, plant_waterAmount: String, plant_isWatered: Bool = false) {
            self.id = id
            self.plant_name = plant_name
            self.plant_room = plant_room
            self.plant_light = plant_light
            self.plant_wateringDays = plant_wateringDays
            self.plant_waterAmount = plant_waterAmount
            self.plant_isWatered = plant_isWatered
        }
    }


