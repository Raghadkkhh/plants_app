//
//  PlantOptions.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import Foundation

enum Room: String, Codable, CaseIterable, Identifiable {
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"
    case balcony = "Balcony"
    case bathroom = "Bathroom"

    var id: String { rawValue }
}

enum LightLevel: String, Codable, CaseIterable, Identifiable {
    case fullSun = "Full sun"
    case partialSun = "Partial sun"
    case lowLight = "Low light"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .fullSun: return "sun.max"
        case .partialSun: return "cloud.sun"
        case .lowLight: return "cloud"
        }
    }
}

enum WateringFrequency: String, Codable, CaseIterable, Identifiable {
    case everyDay = "Every day"
    case every2Days = "Every 2 days"
    case every3Days = "Every 3 days"
    case onceAWeek = "Once a week"
    case every10Days = "Every 10 days"
    case every2Weeks = "Every 2 weeks"

    var id: String { rawValue }

    var days: Int {
        switch self {
        case .everyDay: return 1
        case .every2Days: return 2
        case .every3Days: return 3
        case .onceAWeek: return 7
        case .every10Days: return 10
        case .every2Weeks: return 14
        }
    }
}

enum WaterAmount: String, Codable, CaseIterable, Identifiable {
    case small = "20-50 ml"
    case medium = "50-100 ml"
    case large = "100-200 ml"
    case xlarge = "200-300 ml"

    var id: String { rawValue }
}
