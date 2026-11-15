//
//  PlantsSummary.swift
//  Plants
//
//  Created by Raghad Alsnaie on 15/11/2026.
//

import Foundation

struct PlantsSummary {
    let total: Int
    let watered: Int

    var progress: Double {
        total == 0 ? 0 : Double(watered) / Double(total)
    }

    var message: String {
        watered == 0
            ? "Your plants are waiting for a sip 💦"
            : "\(watered) of your plants feel loved today ✨"
    }
}
